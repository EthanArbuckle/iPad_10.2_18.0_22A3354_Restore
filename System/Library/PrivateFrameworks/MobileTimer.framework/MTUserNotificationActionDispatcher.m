@implementation MTUserNotificationActionDispatcher

- (MTUserNotificationActionDispatcher)initWithAlarmStorage:(id)a3 timerStorage:(id)a4
{
  id v7;
  id v8;
  MTUserNotificationActionDispatcher *v9;
  MTUserNotificationActionDispatcher *v10;
  uint64_t v11;
  MTMetrics *metrics;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MTUserNotificationActionDispatcher;
  v9 = -[MTUserNotificationActionDispatcher init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_alarmStorage, a3);
    objc_storeStrong((id *)&v10->_timerStorage, a4);
    v11 = objc_opt_new();
    metrics = v10->_metrics;
    v10->_metrics = (MTMetrics *)v11;

  }
  return v10;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  void (**v16)(_QWORD);
  _QWORD v17[4];
  void (**v18)(_QWORD);
  uint8_t buf[4];
  MTUserNotificationActionDispatcher *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void (**)(_QWORD))a5;
  kdebug_trace();
  MTLogForCategory(3);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = self;
    _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ received notification response", buf, 0xCu);
  }

  objc_msgSend(v7, "notification");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "request");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "content");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "categoryIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v13, "isEqualToString:", CFSTR("MTAlarmCategory")) & 1) != 0
    || (objc_msgSend(v13, "isEqualToString:", CFSTR("MTAlarmNoSnoozeCategory")) & 1) != 0
    || (objc_msgSend(v13, "isEqualToString:", CFSTR("MTWakeUpAlarmNoSnoozeCategory")) & 1) != 0
    || (objc_msgSend(v13, "isEqualToString:", CFSTR("AlarmSnoozeCountdown")) & 1) != 0
    || (objc_msgSend(v13, "isEqualToString:", CFSTR("MTBedtimeAlarmCategory")) & 1) != 0
    || objc_msgSend(v13, "isEqualToString:", CFSTR("MTWakeUpAlarmCategory")))
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __114__MTUserNotificationActionDispatcher_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke;
    v17[3] = &unk_1E39CC398;
    v18 = v8;
    -[MTUserNotificationActionDispatcher _handleAlarmNotificationResponse:withCompletionHandler:](self, "_handleAlarmNotificationResponse:withCompletionHandler:", v7, v17);
    v14 = v18;
LABEL_10:

    goto LABEL_11;
  }
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("MTTimerCategory")))
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __114__MTUserNotificationActionDispatcher_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_2;
    v15[3] = &unk_1E39CC398;
    v16 = v8;
    -[MTUserNotificationActionDispatcher _handleTimerNotificationResponse:withCompletionHandler:](self, "_handleTimerNotificationResponse:withCompletionHandler:", v7, v15);
    v14 = v16;
    goto LABEL_10;
  }
  kdebug_trace();
  if (v8)
    v8[2](v8);
LABEL_11:

}

uint64_t __114__MTUserNotificationActionDispatcher_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  kdebug_trace();
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __114__MTUserNotificationActionDispatcher_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  kdebug_trace();
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (unint64_t)_alarmNotificationActionForUserNotificationAction:(id)a3 category:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("MTAlarmSnoozeAction")) & 1) != 0)
  {
    v7 = 1;
    goto LABEL_14;
  }
  if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CEC828]))
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("MTAlarmGoToBedAction")) & 1) != 0)
    {
      v7 = 3;
      goto LABEL_14;
    }
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("MTAlarmDismissAction")) & 1) == 0
      && (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CEC818]) & 1) == 0
      && !objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CEC808]))
    {
      v7 = 0;
      goto LABEL_14;
    }
LABEL_13:
    v7 = 2;
    goto LABEL_14;
  }
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("MTAlarmNoSnoozeCategory")) & 1) != 0)
    goto LABEL_13;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("MTWakeUpAlarmNoSnoozeCategory")))
    v7 = 2;
  else
    v7 = 1;
LABEL_14:

  return v7;
}

- (void)_handleAlarmNotificationResponse:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  MTUserNotificationActionDispatcher *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  objc_msgSend(v6, "actionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "content");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "categoryIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  MTLogForCategory(3);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 138543874;
    v27 = self;
    v28 = 2114;
    v29 = v12;
    v30 = 2114;
    v31 = v8;
    _os_log_impl(&dword_19AC4E000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ received response for category %{public}@ and action %{public}@", (uint8_t *)&v26, 0x20u);
  }

  v14 = objc_msgSend((id)objc_opt_class(), "_alarmNotificationActionForUserNotificationAction:category:", v8, v12);
  if (v14)
  {
    v15 = v14;
    objc_msgSend(v6, "notification");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "request");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTUserNotificationActionDispatcher handleAlarmNotificationIdentifier:action:category:completionHandler:](self, "handleAlarmNotificationIdentifier:action:category:completionHandler:", v18, v15, v12, v7);

  }
  else
  {
    MTLogForCategory(3);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MTUserNotificationActionDispatcher _handleAlarmNotificationResponse:withCompletionHandler:].cold.1((uint64_t)v8, v19, v20, v21, v22, v23, v24, v25);

    if (v7)
      v7[2](v7);
  }

}

- (void)handleAlarmNotificationIdentifier:(id)a3 action:(unint64_t)a4 category:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  id v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  uint8_t buf[4];
  MTUserNotificationActionDispatcher *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  objc_msgSend(a3, "mtStringByRemovingNotificationPrefixes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "isEqualToString:", CFSTR("MTBedtimeAlarmCategory"));
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("MTWakeUpAlarmCategory")) & 1) != 0)
    v14 = 1;
  else
    v14 = objc_msgSend(v10, "isEqualToString:", CFSTR("MTWakeUpAlarmNoSnoozeCategory"));
  v15 = objc_msgSend(v10, "isEqualToString:", CFSTR("AlarmSnoozeCountdown"));
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __106__MTUserNotificationActionDispatcher_handleAlarmNotificationIdentifier_action_category_completionHandler___block_invoke;
  v33[3] = &unk_1E39CBF18;
  v33[4] = self;
  v34 = v11;
  v16 = v11;
  v17 = (void *)MEMORY[0x19AED0080](v33);
  if (a4 == 3)
  {
    if ((v13 & 1) == 0)
      NSLog(CFSTR("Unexpected alert for go to bed action"));
    MTLogForCategory(3);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v36 = self;
      v37 = 2114;
      v38 = v12;
      _os_log_impl(&dword_19AC4E000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ received go to bed action for bedtime notification %{public}@", buf, 0x16u);
    }

    -[MTUserNotificationActionDispatcher alarmStorage](self, "alarmStorage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dismissAlarmWithIdentifier:dismissAction:withCompletion:source:", v12, 2, v17, 0);

    -[MTUserNotificationActionDispatcher metrics](self, "metrics");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v25;
    v26 = 2;
    goto LABEL_36;
  }
  if (a4 == 2)
  {
LABEL_21:
    MTLogForCategory(3);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v28)
      {
        *(_DWORD *)buf = 138543618;
        v36 = self;
        v37 = 2114;
        v38 = v12;
        _os_log_impl(&dword_19AC4E000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ received dismiss action for wakeup alarm %{public}@", buf, 0x16u);
      }

      -[MTUserNotificationActionDispatcher alarmStorage](self, "alarmStorage");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "dismissAlarmWithIdentifier:dismissAction:withCompletion:source:", v12, 5, v17, 0);

      -[MTUserNotificationActionDispatcher metrics](self, "metrics");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v25;
      v26 = 5;
    }
    else if (v13)
    {
      if (v28)
      {
        *(_DWORD *)buf = 138543618;
        v36 = self;
        v37 = 2114;
        v38 = v12;
        _os_log_impl(&dword_19AC4E000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ received dismiss action for bedtime notification %{public}@", buf, 0x16u);
      }

      -[MTUserNotificationActionDispatcher alarmStorage](self, "alarmStorage");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "dismissAlarmWithIdentifier:dismissAction:withCompletion:source:", v12, 1, v17, 0);

      -[MTUserNotificationActionDispatcher metrics](self, "metrics");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v25;
      v26 = 1;
    }
    else if (v15)
    {
      if (v28)
      {
        *(_DWORD *)buf = 138543618;
        v36 = self;
        v37 = 2114;
        v38 = v12;
        _os_log_impl(&dword_19AC4E000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ received dismiss action for snooze countdown notification %{public}@", buf, 0x16u);
      }

      -[MTUserNotificationActionDispatcher alarmStorage](self, "alarmStorage");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "dismissAlarmWithIdentifier:dismissAction:withCompletion:source:", v12, 6, v17, 0);

      -[MTUserNotificationActionDispatcher metrics](self, "metrics");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v25;
      v26 = 6;
    }
    else
    {
      if (v28)
      {
        *(_DWORD *)buf = 138543618;
        v36 = self;
        v37 = 2114;
        v38 = v12;
        _os_log_impl(&dword_19AC4E000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ received dismiss action for alarm %{public}@", buf, 0x16u);
      }

      -[MTUserNotificationActionDispatcher alarmStorage](self, "alarmStorage");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "dismissAlarmWithIdentifier:dismissAction:withCompletion:source:", v12, 0, v17, 0);

      -[MTUserNotificationActionDispatcher metrics](self, "metrics");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v25;
      v26 = 0;
    }
LABEL_36:
    objc_msgSend(v25, "logAlarmDismissAction:", v26);
    goto LABEL_37;
  }
  if (a4 != 1)
  {
    NSLog(CFSTR("Unexpected action type: %ld"), a4);
    goto LABEL_21;
  }
  MTLogForCategory(3);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v36 = self;
    v37 = 2114;
    v38 = v12;
    _os_log_impl(&dword_19AC4E000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ received snooze action for %{public}@", buf, 0x16u);
  }

  v19 = 2;
  if (!v14)
    v19 = 0;
  if (v13)
    v20 = 1;
  else
    v20 = v19;
  -[MTUserNotificationActionDispatcher alarmStorage](self, "alarmStorage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "snoozeAlarmWithIdentifier:snoozeAction:withCompletion:source:", v12, v20, v17, 0);

  -[MTUserNotificationActionDispatcher metrics](self, "metrics");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "logAlarmSnoozeAction:", v20);
LABEL_37:

}

uint64_t __106__MTUserNotificationActionDispatcher_handleAlarmNotificationIdentifier_action_category_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(3);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ calling completion", (uint8_t *)&v5, 0xCu);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (unint64_t)_timerNotificationActionForUserNotificationAction:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MTTimerRepeatAction")) & 1) != 0)
    v4 = 2;
  else
    v4 = (objc_msgSend(v3, "isEqualToString:", CFSTR("MTTimerDismissAction")) & 1) != 0
      || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEC818]) & 1) != 0
      || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEC808]) & 1) != 0
      || objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEC828]);

  return v4;
}

- (void)_handleTimerNotificationResponse:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t);
  void *v32;
  MTUserNotificationActionDispatcher *v33;
  id v34;
  uint8_t buf[4];
  MTUserNotificationActionDispatcher *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v29 = MEMORY[0x1E0C809B0];
  v30 = 3221225472;
  v31 = __93__MTUserNotificationActionDispatcher__handleTimerNotificationResponse_withCompletionHandler___block_invoke;
  v32 = &unk_1E39CBF18;
  v33 = self;
  v8 = (void (**)(_QWORD))v7;
  v34 = v8;
  v9 = (void *)MEMORY[0x19AED0080](&v29);
  objc_msgSend(v6, "actionIdentifier", v29, v30, v31, v32, v33);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  MTLogForCategory(3);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v36 = self;
    v37 = 2114;
    v38 = v10;
    _os_log_impl(&dword_19AC4E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ received response for action %{public}@", buf, 0x16u);
  }

  v12 = objc_msgSend((id)objc_opt_class(), "_timerNotificationActionForUserNotificationAction:", v10);
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v6, "notification");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "request");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 == 2)
    {
      MTLogForCategory(4);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v36 = self;
        v37 = 2114;
        v38 = v16;
        _os_log_impl(&dword_19AC4E000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ received repeat action for timer %{public}@", buf, 0x16u);
      }

      -[MTUserNotificationActionDispatcher timerStorage](self, "timerStorage");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "repeatTimerWithIdentifier:withCompletion:source:", v16, v9, 0);

      -[MTUserNotificationActionDispatcher metrics](self, "metrics");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "logTimerRepeated");
    }
    else
    {
      if (v13 != 1)
      {
LABEL_16:

        goto LABEL_17;
      }
      MTLogForCategory(4);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v36 = self;
        v37 = 2114;
        v38 = v16;
        _os_log_impl(&dword_19AC4E000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ received dismiss action for timer %{public}@", buf, 0x16u);
      }

      -[MTUserNotificationActionDispatcher timerStorage](self, "timerStorage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dismissTimerWithIdentifier:withCompletion:source:", v16, v9, 0);

      -[MTUserNotificationActionDispatcher metrics](self, "metrics");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "logTimerDismissed");
    }

    goto LABEL_16;
  }
  MTLogForCategory(4);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    -[MTUserNotificationActionDispatcher _handleTimerNotificationResponse:withCompletionHandler:].cold.1((uint64_t)v10, v20, v21, v22, v23, v24, v25, v26);

  v8[2](v8);
LABEL_17:

}

uint64_t __93__MTUserNotificationActionDispatcher__handleTimerNotificationResponse_withCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ calling completion", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (MTAlarmStorage)alarmStorage
{
  return self->_alarmStorage;
}

- (void)setAlarmStorage:(id)a3
{
  objc_storeStrong((id *)&self->_alarmStorage, a3);
}

- (MTTimerStorage)timerStorage
{
  return self->_timerStorage;
}

- (void)setTimerStorage:(id)a3
{
  objc_storeStrong((id *)&self->_timerStorage, a3);
}

- (MTMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_timerStorage, 0);
  objc_storeStrong((id *)&self->_alarmStorage, 0);
}

- (void)_handleAlarmNotificationResponse:(uint64_t)a3 withCompletionHandler:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_19AC4E000, a2, a3, "Unexpected alarm notification action: %{public}@", a5, a6, a7, a8, 2u);
}

- (void)_handleTimerNotificationResponse:(uint64_t)a3 withCompletionHandler:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_19AC4E000, a2, a3, "Unexpected timer notification action: %{public}@", a5, a6, a7, a8, 2u);
}

@end
