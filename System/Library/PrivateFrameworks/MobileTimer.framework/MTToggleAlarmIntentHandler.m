@implementation MTToggleAlarmIntentHandler

- (void)confirmEnableAlarm:(id)a3 completion:(id)a4
{
  void (**v6)(id, id);
  id v7;
  MTEnableAlarmIntentResponse *v8;
  void *v9;
  MTEnableAlarmIntentResponse *v10;

  v6 = (void (**)(id, id))a4;
  v7 = a3;
  v8 = [MTEnableAlarmIntentResponse alloc];
  -[MTToggleAlarmIntentHandler _alarmUserActivityWithEnableIntent:](self, "_alarmUserActivityWithEnableIntent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[MTEnableAlarmIntentResponse initWithCode:userActivity:](v8, "initWithCode:userActivity:", 1, v9);
  v6[2](v6, v10);

}

- (void)confirmDisableAlarm:(id)a3 completion:(id)a4
{
  void (**v6)(id, id);
  id v7;
  MTDisableAlarmIntentResponse *v8;
  void *v9;
  MTDisableAlarmIntentResponse *v10;

  v6 = (void (**)(id, id))a4;
  v7 = a3;
  v8 = [MTDisableAlarmIntentResponse alloc];
  -[MTToggleAlarmIntentHandler _alarmUserActivityWithDisableIntent:](self, "_alarmUserActivityWithDisableIntent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[MTDisableAlarmIntentResponse initWithCode:userActivity:](v8, "initWithCode:userActivity:", 1, v9);
  v6[2](v6, v10);

}

- (void)handleEnableAlarm:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  MTLogForCategory(3);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[MTToggleAlarmIntentHandler handleEnableAlarm:completion:].cold.1();

  objc_msgSend(v6, "alarmID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__MTToggleAlarmIntentHandler_handleEnableAlarm_completion___block_invoke;
  v12[3] = &unk_1E39CB4C0;
  v13 = v7;
  v11 = v7;
  -[MTToggleAlarmIntentHandler _toggleAlarm:alarmIDString:completion:](self, "_toggleAlarm:alarmIDString:completion:", MEMORY[0x1E0C9AAB0], v10, v12);

}

void __59__MTToggleAlarmIntentHandler_handleEnableAlarm_completion___block_invoke(uint64_t a1, int a2)
{
  MTEnableAlarmIntentResponse *v4;
  uint64_t v5;
  MTEnableAlarmIntentResponse *v6;

  if (*(_QWORD *)(a1 + 32))
  {
    v4 = [MTEnableAlarmIntentResponse alloc];
    if (a2)
      v5 = 4;
    else
      v5 = 5;
    v6 = -[MTEnableAlarmIntentResponse initWithCode:userActivity:](v4, "initWithCode:userActivity:", v5, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (void)handleDisableAlarm:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  MTLogForCategory(3);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[MTToggleAlarmIntentHandler handleDisableAlarm:completion:].cold.1();

  objc_msgSend(v6, "alarmID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__MTToggleAlarmIntentHandler_handleDisableAlarm_completion___block_invoke;
  v12[3] = &unk_1E39CB4C0;
  v13 = v7;
  v11 = v7;
  -[MTToggleAlarmIntentHandler _toggleAlarm:alarmIDString:completion:](self, "_toggleAlarm:alarmIDString:completion:", MEMORY[0x1E0C9AAA0], v10, v12);

}

void __60__MTToggleAlarmIntentHandler_handleDisableAlarm_completion___block_invoke(uint64_t a1, int a2)
{
  MTDisableAlarmIntentResponse *v4;
  uint64_t v5;
  MTDisableAlarmIntentResponse *v6;

  if (*(_QWORD *)(a1 + 32))
  {
    v4 = [MTDisableAlarmIntentResponse alloc];
    if (a2)
      v5 = 4;
    else
      v5 = 5;
    v6 = -[MTDisableAlarmIntentResponse initWithCode:userActivity:](v4, "initWithCode:userActivity:", v5, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (void)resolveAlarmForToggleAlarm:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "alarm");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    -[MTAlarmIntentHandler alarmManager](self, "alarmManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "alarmsIncludingSleepAlarm:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __72__MTToggleAlarmIntentHandler_resolveAlarmForToggleAlarm_withCompletion___block_invoke;
    v20[3] = &unk_1E39CB4E8;
    v14 = v7;
    v21 = v14;
    v15 = (id)objc_msgSend(v12, "addFailureBlock:", v20);
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __72__MTToggleAlarmIntentHandler_resolveAlarmForToggleAlarm_withCompletion___block_invoke_2;
    v17[3] = &unk_1E39CB538;
    v18 = v6;
    v19 = v14;
    v16 = (id)objc_msgSend(v12, "addSuccessBlock:", v17);

  }
  else
  {
    +[MTIntentAlarmResolutionResult needsValue](MTIntentAlarmResolutionResult, "needsValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v12);
  }

}

void __72__MTToggleAlarmIntentHandler_resolveAlarmForToggleAlarm_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[MTIntentAlarmResolutionResult unsupported](MTIntentAlarmResolutionResult, "unsupported");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __72__MTToggleAlarmIntentHandler_resolveAlarmForToggleAlarm_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__MTToggleAlarmIntentHandler_resolveAlarmForToggleAlarm_withCompletion___block_invoke_3;
  v9[3] = &unk_1E39CB510;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(a2, "na_firstObjectPassingTest:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    objc_msgSend(v4, "intentAlarm");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTIntentAlarmResolutionResult successWithResolvedAlarm:](MTIntentAlarmResolutionResult, "successWithResolvedAlarm:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v8);

  }
  else
  {
    +[MTIntentAlarmResolutionResult needsValue](MTIntentAlarmResolutionResult, "needsValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }

}

uint64_t __72__MTToggleAlarmIntentHandler_resolveAlarmForToggleAlarm_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "alarmIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "alarm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  return v6;
}

- (void)resolveStateForToggleAlarm:(id)a3 withCompletion:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void (**v10)(id, uint64_t);

  v10 = (void (**)(id, uint64_t))a4;
  v5 = a3;
  if (objc_msgSend(v5, "state"))
  {
    v6 = objc_msgSend(v5, "state");

    +[MTAlarmStateResolutionResult successWithResolvedAlarmState:](MTAlarmStateResolutionResult, "successWithResolvedAlarmState:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_msgSend(v5, "operation");

    if (v8 == 1)
      +[MTAlarmStateResolutionResult needsValue](MTAlarmStateResolutionResult, "needsValue");
    else
      +[MTAlarmStateResolutionResult notRequired](MTAlarmStateResolutionResult, "notRequired");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v7;
  v10[2](v10, v7);

}

- (void)provideAlarmOptionsForToggleAlarm:(id)a3 withCompletion:(id)a4
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
  v15[2] = __79__MTToggleAlarmIntentHandler_provideAlarmOptionsForToggleAlarm_withCompletion___block_invoke;
  v15[3] = &unk_1E39CB4E8;
  v9 = v5;
  v16 = v9;
  v10 = (id)objc_msgSend(v7, "addFailureBlock:", v15);
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __79__MTToggleAlarmIntentHandler_provideAlarmOptionsForToggleAlarm_withCompletion___block_invoke_2;
  v13[3] = &unk_1E39CB580;
  v14 = v9;
  v11 = v9;
  v12 = (id)objc_msgSend(v7, "addSuccessBlock:", v13);

}

uint64_t __79__MTToggleAlarmIntentHandler_provideAlarmOptionsForToggleAlarm_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__MTToggleAlarmIntentHandler_provideAlarmOptionsForToggleAlarm_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "na_map:", &__block_literal_global_1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __79__MTToggleAlarmIntentHandler_provideAlarmOptionsForToggleAlarm_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "intentAlarm");
}

- (void)confirmToggleAlarm:(id)a3 completion:(id)a4
{
  void (**v4)(id, MTToggleAlarmIntentResponse *);
  MTToggleAlarmIntentResponse *v5;

  v4 = (void (**)(id, MTToggleAlarmIntentResponse *))a4;
  v5 = -[MTToggleAlarmIntentResponse initWithCode:userActivity:]([MTToggleAlarmIntentResponse alloc], "initWithCode:userActivity:", 1, 0);
  v4[2](v4, v5);

}

- (void)handleToggleAlarm:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  MTLogForCategory(3);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[MTToggleAlarmIntentHandler handleToggleAlarm:completion:].cold.1();

  v9 = objc_msgSend(v6, "operation");
  if (v9 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "state") == 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v6, "alarm");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__MTToggleAlarmIntentHandler_handleToggleAlarm_completion___block_invoke;
  v15[3] = &unk_1E39CB5A8;
  v16 = v6;
  v17 = v7;
  v13 = v6;
  v14 = v7;
  -[MTToggleAlarmIntentHandler _toggleAlarm:alarmIDString:completion:](self, "_toggleAlarm:alarmIDString:completion:", v10, v12, v15);

  if (v9 == 1)
}

void __59__MTToggleAlarmIntentHandler_handleToggleAlarm_completion___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  MTToggleAlarmIntentResponse *v6;
  uint64_t v7;
  void *v8;
  MTToggleAlarmIntentResponse *v9;

  if (*(_QWORD *)(a1 + 40))
  {
    v6 = [MTToggleAlarmIntentResponse alloc];
    if (a2)
      v7 = 4;
    else
      v7 = 5;
    v9 = -[MTToggleAlarmIntentResponse initWithCode:userActivity:](v6, "initWithCode:userActivity:", v7, 0);
    -[MTToggleAlarmIntentResponse setState:](v9, "setState:", a3);
    objc_msgSend(*(id *)(a1 + 32), "alarm");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTToggleAlarmIntentResponse setAlarm:](v9, "setAlarm:", v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (void)resolveOperationForToggleAlarm:(id)a3 withCompletion:(id)a4
{
  void (**v5)(id, void *);
  void *v6;
  id v7;

  v7 = a3;
  v5 = (void (**)(id, void *))a4;
  if (objc_msgSend(v7, "operation"))
    +[MTAlarmOperationResolutionResult successWithResolvedAlarmOperation:](MTAlarmOperationResolutionResult, "successWithResolvedAlarmOperation:", objc_msgSend(v7, "operation"));
  else
    +[MTAlarmOperationResolutionResult needsValue](MTAlarmOperationResolutionResult, "needsValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v6);

}

- (void)_toggleAlarm:(id)a3 alarmIDString:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD *v23;
  _QWORD v24[4];
  id v25;
  _QWORD *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD *v30;
  id v31;
  _QWORD v32[4];
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MTAlarmIntentHandler alarmManager](self, "alarmManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "alarmsIncludingSleepAlarm:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v32[3] = 0;
  v13 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __68__MTToggleAlarmIntentHandler__toggleAlarm_alarmIDString_completion___block_invoke;
  v27[3] = &unk_1E39CB5D0;
  objc_copyWeak(&v31, &location);
  v14 = v9;
  v28 = v14;
  v15 = v8;
  v29 = v15;
  v30 = v32;
  objc_msgSend(v12, "flatMap:", v27);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v13;
  v24[1] = 3221225472;
  v24[2] = __68__MTToggleAlarmIntentHandler__toggleAlarm_alarmIDString_completion___block_invoke_17;
  v24[3] = &unk_1E39CB5F8;
  v17 = v10;
  v25 = v17;
  v26 = v32;
  v18 = (id)objc_msgSend(v16, "addSuccessBlock:", v24);
  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = __68__MTToggleAlarmIntentHandler__toggleAlarm_alarmIDString_completion___block_invoke_2;
  v21[3] = &unk_1E39CB620;
  v19 = v17;
  v22 = v19;
  v23 = v32;
  v20 = (id)objc_msgSend(v16, "addFailureBlock:", v21);

  objc_destroyWeak(&v31);
  _Block_object_dispose(v32, 8);
  objc_destroyWeak(&location);

}

id __68__MTToggleAlarmIntentHandler__toggleAlarm_alarmIDString_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  uint64_t v19;
  void *v20;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  _BYTE v31[18];
  __int16 v32;
  int v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  MTLogForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v29 = WeakRetained;
    v30 = 2114;
    *(_QWORD *)v31 = v3;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ alarm fetch returned alarms: %{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 32);
  if (!v6)
    goto LABEL_9;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __68__MTToggleAlarmIntentHandler__toggleAlarm_alarmIDString_completion___block_invoke_11;
  v26[3] = &unk_1E39CB510;
  v27 = v6;
  objc_msgSend(v3, "na_firstObjectPassingTest:", v26);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_9:
    MTLogForCategory(3);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __68__MTToggleAlarmIntentHandler__toggleAlarm_alarmIDString_completion___block_invoke_cold_1((uint64_t)WeakRetained, v12);

    v13 = (void *)MEMORY[0x1E0D519C0];
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v34 = *MEMORY[0x1E0CB2D68];
    v35[0] = CFSTR("Found no alarm to enable/disable");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mobiletimer.alarmintent"), 0, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "futureWithError:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  v8 = objc_msgSend(WeakRetained, "getEnableStateForAlarm:", v7);
  v9 = *(void **)(a1 + 40);
  if (!v9)
    goto LABEL_12;
  if (v8 != objc_msgSend(v9, "BOOLValue"))
  {
    v10 = *(void **)(a1 + 40);
    if (v10)
    {
      v11 = objc_msgSend(v10, "BOOLValue");
LABEL_13:
      MTLogForCategory(3);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v29 = WeakRetained;
        v30 = 1024;
        *(_DWORD *)v31 = v11;
        *(_WORD *)&v31[4] = 2114;
        *(_QWORD *)&v31[6] = v7;
        _os_log_impl(&dword_19AC4E000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating enable state to %i for alarm: %{public}@", buf, 0x1Cu);
      }

      objc_msgSend(WeakRetained, "updateEnableStateForAlarm:enabled:", v7, v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(WeakRetained, "getEnableStateForAlarm:", v15);
      v19 = 1;
      if (!v18)
        v19 = 2;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v19;
      objc_msgSend(WeakRetained, "alarmManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "updateAlarm:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
      goto LABEL_19;
    }
LABEL_12:
    v11 = v8 ^ 1u;
    goto LABEL_13;
  }
  MTLogForCategory(3);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    v29 = WeakRetained;
    v30 = 2114;
    *(_QWORD *)v31 = v7;
    *(_WORD *)&v31[8] = 2114;
    *(_QWORD *)&v31[10] = v23;
    v32 = 1024;
    v33 = v8;
    _os_log_impl(&dword_19AC4E000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ Alarm being modified: %{public}@. Enabled state from intent: %{public}@, current alarm enable state: %i", buf, 0x26u);
  }

  v24 = 1;
  if (!v8)
    v24 = 2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v24;
  MTLogForCategory(3);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v29 = WeakRetained;
    v30 = 2114;
    *(_QWORD *)v31 = v7;
    _os_log_impl(&dword_19AC4E000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ alarm state already matches intent state : %{public}@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v16;
}

uint64_t __68__MTToggleAlarmIntentHandler__toggleAlarm_alarmIDString_completion___block_invoke_11(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "alarmID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

uint64_t __68__MTToggleAlarmIntentHandler__toggleAlarm_alarmIDString_completion___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 1, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

uint64_t __68__MTToggleAlarmIntentHandler__toggleAlarm_alarmIDString_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

- (BOOL)getEnableStateForAlarm:(id)a3
{
  id v3;
  char v4;
  int v5;
  char v6;
  char v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "isSleepAlarm");
  v5 = objc_msgSend(v3, "isEnabled");
  v6 = v4 ^ 1;
  v7 = (v4 ^ 1) & v5;
  if ((v6 & 1) == 0 && v5)
    v7 = objc_msgSend(v3, "sleepSchedule");

  return v7;
}

- (id)updateEnableStateForAlarm:(id)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  int v7;
  void *v8;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v6, "setEnabled:", v4);
  v7 = objc_msgSend(v5, "isSleepAlarm");

  if (v7)
    objc_msgSend(v6, "setSleepSchedule:", v4);
  v8 = (void *)objc_msgSend(v6, "copy");

  return v8;
}

- (id)_alarmUserActivityWithEnableIntent:(id)a3
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

- (id)_alarmUserActivityWithDisableIntent:(id)a3
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

- (void)handleEnableAlarm:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_19AC4E000, v0, v1, "%s intent:%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)handleDisableAlarm:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_19AC4E000, v0, v1, "%s intent:%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)handleToggleAlarm:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_19AC4E000, v0, v1, "%s intent:%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __68__MTToggleAlarmIntentHandler__toggleAlarm_alarmIDString_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_19AC4E000, a2, OS_LOG_TYPE_ERROR, "%{public}@ found no alarm to enable", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
