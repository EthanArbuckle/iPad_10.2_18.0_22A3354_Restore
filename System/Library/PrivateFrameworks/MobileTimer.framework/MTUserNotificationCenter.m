@implementation MTUserNotificationCenter

- (MTUserNotificationCenter)init
{
  MTUserNotificationCenter *v2;
  NSObject *v3;
  objc_super v5;
  uint8_t buf[4];
  MTUserNotificationCenter *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)MTUserNotificationCenter;
  v2 = -[MTUserNotificationCenter init](&v5, sel_init);
  if (v2)
  {
    MTLogForCategory(3);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v7 = v2;
      _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@...", buf, 0xCu);
    }

  }
  return v2;
}

- (void)setupNotificationCenter
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  NSDictionary *v8;
  NSDictionary *notificationCenters;
  const __CFString *v10;
  void *v11;
  uint8_t buf[4];
  MTUserNotificationCenter *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ setting up notification centers", buf, 0xCu);
  }

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEC7A0]), "initWithBundleIdentifier:", CFSTR("com.apple.mobiletimer"));
  -[MTUserNotificationCenter notificationCategories](self, "notificationCategories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MTLogForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 138543874;
    v13 = self;
    v14 = 2048;
    v15 = v7;
    v16 = 2114;
    v17 = CFSTR("com.apple.mobiletimer");
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ setting %lu categories for %{public}@", buf, 0x20u);
  }

  objc_msgSend(v4, "setNotificationCategories:", v5);
  v10 = CFSTR("com.apple.mobiletimer");
  v11 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  notificationCenters = self->_notificationCenters;
  self->_notificationCenters = v8;

}

- (void)registerActionHandler:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  MTUserNotificationActionDispatcher *actionHandler;
  _QWORD v9[5];
  uint8_t buf[4];
  MTUserNotificationCenter *v11;
  __int16 v12;
  MTUserNotificationActionDispatcher *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_actionHandler, a3);
  -[NSDictionary allValues](self->_notificationCenters, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__MTUserNotificationCenter_registerActionHandler___block_invoke;
  v9[3] = &unk_1E39CD900;
  v9[4] = self;
  objc_msgSend(v6, "na_each:", v9);

  MTLogForCategory(3);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    actionHandler = self->_actionHandler;
    *(_DWORD *)buf = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = actionHandler;
    _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ handling responses with %{public}@", buf, 0x16u);
  }

}

void __50__MTUserNotificationCenter_registerActionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = a2;
  objc_msgSend(v3, "setDelegate:", v2);
  objc_msgSend(v3, "setWantsNotificationResponsesDelivered");

}

- (id)alarmCategories
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[3];
  void *v32;
  void *v33;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ALARM_STOP_ACTION"), &stru_1E39CF258, CFSTR("Localizable"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ALARM_SNOOZE_ACTION"), &stru_1E39CF258, CFSTR("Localizable"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CEC700];
  objc_msgSend(MEMORY[0x1E0CEC710], "iconWithSystemImageName:", CFSTR("stop.circle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionWithIdentifier:title:options:icon:", CFSTR("MTAlarmDismissAction"), v30, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CEC700];
  objc_msgSend(MEMORY[0x1E0CEC710], "iconWithSystemImageName:", CFSTR("zzz"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionWithIdentifier:title:options:icon:", CFSTR("MTAlarmSnoozeAction"), v29, 0, v8);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CEC720];
  v34[0] = v28;
  v34[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v9, "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("MTAlarmCategory"), v10, MEMORY[0x1E0C9AA60], 0x141F00003);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CEC720];
  v33 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("MTAlarmNoSnoozeCategory"), v14, v11, 0x141F00003);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("SNOOZE_STOP"), &stru_1E39CF258, CFSTR("Localizable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0CEC700];
  objc_msgSend(MEMORY[0x1E0CEC710], "iconWithSystemImageName:", CFSTR("stop.circle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "actionWithIdentifier:title:options:icon:", CFSTR("MTAlarmDismissAction"), v17, 0, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0CEC6D0];
  v32 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("AlarmSnoozeCountdown"), v22, v11, 131073);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "setListPriority:", 1);
  v24 = (void *)MEMORY[0x1E0C99E60];
  v31[0] = v12;
  v31[1] = v15;
  v31[2] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setWithArray:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)timerCategories
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("TIMER_STOP_ACTION"), &stru_1E39CF258, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("TIMER_REPEAT_ACTION"), &stru_1E39CF258, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEC700], "actionWithIdentifier:title:options:", CFSTR("MTTimerDismissAction"), v3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEC700], "actionWithIdentifier:title:options:", CFSTR("MTTimerRepeatAction"), v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CEC720];
  v16[0] = v6;
  v16[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("MTTimerCategory"), v9, MEMORY[0x1E0C9AA60], 0x141F00003);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99E60];
  v15 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)bedtimeCategories
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[3];
  void *v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("BEDTIME_GO_TO_BED_ACTION"), &stru_1E39CF258, CFSTR("Localizable"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("BEDTIME_SNOOZE_ACTION"), &stru_1E39CF258, CFSTR("Localizable"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEC700], "actionWithIdentifier:title:options:", CFSTR("MTAlarmGoToBedAction"), v31, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEC700], "actionWithIdentifier:title:options:", CFSTR("MTAlarmSnoozeAction"), v30, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CEC720];
  v35[0] = v28;
  v35[1] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v4, "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("MTBedtimeAlarmCategory"), v5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ALARM_STOP_ACTION"), &stru_1E39CF258, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ALARM_SNOOZE_ACTION"), &stru_1E39CF258, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CEC700];
  objc_msgSend(MEMORY[0x1E0CEC710], "iconWithSystemImageName:", CFSTR("stop.circle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "actionWithIdentifier:title:options:icon:", CFSTR("MTAlarmDismissAction"), v8, 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CEC700];
  objc_msgSend(MEMORY[0x1E0CEC710], "iconWithSystemImageName:", CFSTR("zzz"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "actionWithIdentifier:title:options:icon:", CFSTR("MTAlarmSnoozeAction"), v10, 0, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0CEC720];
  v34[0] = v16;
  v34[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("MTWakeUpAlarmCategory"), v18, v6, 0x141F00003);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0CEC720];
  v33 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("MTWakeUpAlarmNoSnoozeCategory"), v21, v6, 0x141F00003);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0C99E20];
  v32[0] = v27;
  v32[1] = v19;
  v32[2] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setWithArray:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)notificationCategories
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTUserNotificationCenter alarmCategories](self, "alarmCategories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v4);

  -[MTUserNotificationCenter timerCategories](self, "timerCategories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v5);

  -[MTUserNotificationCenter bedtimeCategories](self, "bedtimeCategories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v6);

  return v3;
}

- (id)_notificationCenterForScheduledAlarm:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_notificationCenters, "objectForKeyedSubscript:", CFSTR("com.apple.mobiletimer"));
}

- (void)postNotificationForScheduledAlarm:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "contentForScheduledAlarm:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MTUserNotificationCenter postNotificationForScheduledAlarm:content:completionBlock:](self, "postNotificationForScheduledAlarm:content:completionBlock:", v7, v8, v6);

}

- (unint64_t)conditionalAlertDestination
{
  return +[MTUtilities mtSBUIIsSystemApertureEnabled](MTUtilities, "mtSBUIIsSystemApertureEnabled") ^ 1;
}

- (unint64_t)conditionalListDestination
{
  if (+[MTUtilities mtSBUIIsSystemApertureEnabled](MTUtilities, "mtSBUIIsSystemApertureEnabled"))
    return 2;
  else
    return 6;
}

- (unint64_t)conditionalLockScreenDestination
{
  if (+[MTUtilities mtSBUIIsSystemApertureEnabled](MTUtilities, "mtSBUIIsSystemApertureEnabled"))
    return 0;
  else
    return 2;
}

- (void)postNotificationForScheduledAlarm:(id)a3 content:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id location;
  uint8_t buf[4];
  MTUserNotificationCenter *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  MTLogForCategory(3);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v32 = self;
    v33 = 2114;
    v34 = v8;
    _os_log_impl(&dword_19AC4E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ firing %{public}@", buf, 0x16u);
  }

  objc_msgSend((id)objc_opt_class(), "requestIdentifierForScheduledAlarm:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trigger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "triggerType") == 6;

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CEC740], "requestWithIdentifier:content:trigger:destinations:", v12, v9, 0, -[MTUserNotificationCenter conditionalLockScreenDestination](self, "conditionalLockScreenDestination"));
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v8, "trigger");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isForNotification");

    v18 = (void *)MEMORY[0x1E0CEC740];
    v19 = -[MTUserNotificationCenter conditionalAlertDestination](self, "conditionalAlertDestination");
    v20 = -[MTUserNotificationCenter conditionalListDestination](self, "conditionalListDestination");
    if (v17)
      objc_msgSend(v18, "requestWithIdentifier:content:trigger:destinations:", v12, v9, 0, v20 | v19);
    else
      objc_msgSend(v18, "requestWithIdentifier:content:trigger:destinations:", v12, v9, 0, v19 | v20 | 8);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v15;
  objc_initWeak(&location, self);
  kdebug_trace();
  MTLogForCategory(3);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v32 = self;
    v33 = 2114;
    v34 = v21;
    _os_log_impl(&dword_19AC4E000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ adding request %{public}@", buf, 0x16u);
  }

  -[MTUserNotificationCenter _notificationCenterForScheduledAlarm:](self, "_notificationCenterForScheduledAlarm:", v8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __86__MTUserNotificationCenter_postNotificationForScheduledAlarm_content_completionBlock___block_invoke;
  v26[3] = &unk_1E39CD928;
  objc_copyWeak(&v29, &location);
  v24 = v8;
  v27 = v24;
  v25 = v10;
  v28 = v25;
  objc_msgSend(v23, "addNotificationRequest:withCompletionHandler:", v21, v26);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

void __86__MTUserNotificationCenter_postNotificationForScheduledAlarm_content_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "scheduleable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    MTLogForCategory(3);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "alarmID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = WeakRetained;
      v13 = 2114;
      v14 = v10;
      v15 = 2114;
      v16 = v3;
      _os_log_error_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_ERROR, "%{public}@ failed to fire %{public}@ with error %{public}@", (uint8_t *)&v11, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to post alarm user notifiation"));
    v7 = objc_claimAutoreleasedReturnValue();
    +[MTAnalytics sendCriticalEvent:](MTAnalytics, "sendCriticalEvent:", v7);
  }
  else
  {
    kdebug_trace();
    MTLogForCategory(3);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "alarmID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = WeakRetained;
      v13 = 2114;
      v14 = v8;
      _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ fired %{public}@", (uint8_t *)&v11, 0x16u);

    }
  }

  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(void))(v9 + 16))();

}

- (void)dismissRelatedNotificationsForScheduledAlarm:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  MTUserNotificationCenter *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543618;
    v16 = self;
    v17 = 2114;
    v18 = v4;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing related notifications for %{public}@", (uint8_t *)&v15, 0x16u);
  }

  objc_msgSend(v4, "scheduleable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isForAlert");

  if (v8)
  {
    objc_msgSend(v4, "scheduleable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTUserNotificationCenter dismissNotificationsForAlarm:includeMainIdentifier:](self, "dismissNotificationsForAlarm:includeMainIdentifier:", v9, 0);
  }
  else
  {
    v9 = (void *)objc_opt_new();
    objc_msgSend(v4, "trigger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isWakeUpRelated");

    if (v11)
    {
      v12 = (void *)objc_opt_class();
      objc_msgSend(v6, "alarmIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_goToBedIdentifier:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v14);

    }
    -[MTUserNotificationCenter dismissNotificationsWithIdentifiers:](self, "dismissNotificationsWithIdentifiers:", v9);
  }

}

+ (id)_allIdentifiersForAlarm:(id)a3
{
  return (id)objc_msgSend(a1, "_allIdentifiersForAlarm:includeMainIdentifier:", a3, 1);
}

+ (id)_allIdentifiersForAlarm:(id)a3 includeMainIdentifier:(BOOL)a4
{
  return (id)objc_msgSend(a1, "_allIdentifiersForAlarm:includeMainIdentifier:includeSnooze:", a3, a4, 1);
}

+ (id)_allIdentifiersForAlarm:(id)a3 includeMainIdentifier:(BOOL)a4 includeSnooze:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[2];

  v5 = a5;
  v6 = a4;
  v20[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void *)objc_opt_new();
  if (v5)
  {
    v9 = (void *)objc_opt_class();
    objc_msgSend(v7, "alarmIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_snoozeCountdownIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v12);

  }
  if (v6)
  {
    objc_msgSend(v7, "alarmIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v13);

  }
  if (objc_msgSend(v7, "isSleepAlarm"))
  {
    v14 = (void *)objc_opt_class();
    objc_msgSend(v7, "alarmIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_goToBedIdentifier:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v17);

  }
  return v8;
}

- (void)dismissNotificationsForAlarm:(id)a3
{
  -[MTUserNotificationCenter dismissNotificationsForAlarm:includeMainIdentifier:includeSnooze:](self, "dismissNotificationsForAlarm:includeMainIdentifier:includeSnooze:", a3, 1, 1);
}

- (void)dismissNotificationsForAlarm:(id)a3 includeSnooze:(BOOL)a4
{
  -[MTUserNotificationCenter dismissNotificationsForAlarm:includeMainIdentifier:includeSnooze:](self, "dismissNotificationsForAlarm:includeMainIdentifier:includeSnooze:", a3, 1, a4);
}

- (void)dismissNotificationsForAlarm:(id)a3 includeMainIdentifier:(BOOL)a4
{
  -[MTUserNotificationCenter dismissNotificationsForAlarm:includeMainIdentifier:includeSnooze:](self, "dismissNotificationsForAlarm:includeMainIdentifier:includeSnooze:", a3, a4, 1);
}

- (void)dismissNotificationsForAlarm:(id)a3 includeMainIdentifier:(BOOL)a4 includeSnooze:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  MTUserNotificationCenter *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v5 = a5;
  v6 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  MTLogForCategory(3);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138543618;
    v18 = self;
    v19 = 2114;
    v20 = v8;
    _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing any notifications for %{public}@", (uint8_t *)&v17, 0x16u);
  }

  if (v8)
  {
    objc_msgSend((id)objc_opt_class(), "_allIdentifiersForAlarm:includeMainIdentifier:includeSnooze:", v8, v6, v5);
    v10 = objc_claimAutoreleasedReturnValue();
    -[MTUserNotificationCenter dismissNotificationsWithIdentifiers:](self, "dismissNotificationsWithIdentifiers:", v10);
  }
  else
  {
    MTLogForCategory(3);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MTUserNotificationCenter dismissNotificationsForAlarm:includeMainIdentifier:includeSnooze:].cold.1((uint64_t)self, v10, v11, v12, v13, v14, v15, v16);
  }

}

- (void)dismissNotificationsForAlarm:(id)a3 dismissAction:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void **v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  MTUserNotificationCenter *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  MTLogForCategory(3);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    MTDismissAlarmActionDescription(a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v25 = self;
    v26 = 2114;
    v27 = v6;
    v28 = 2114;
    v29 = v8;
    _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing notifications for %{public}@ (%{public}@)", buf, 0x20u);

  }
  if (v6)
  {
    if (a4 - 1 >= 2)
    {
      if (a4 != 6)
      {
        objc_msgSend((id)objc_opt_class(), "_allIdentifiersForAlarm:", v6);
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      v21 = (void *)objc_opt_class();
      objc_msgSend(v6, "alarmIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "_snoozeCountdownIdentifier:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v11;
      v12 = (void *)MEMORY[0x1E0C99D20];
      v13 = &v22;
    }
    else
    {
      v9 = (void *)objc_opt_class();
      objc_msgSend(v6, "alarmIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_goToBedIdentifier:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v11;
      v12 = (void *)MEMORY[0x1E0C99D20];
      v13 = &v23;
    }
    objc_msgSend(v12, "arrayWithObjects:count:", v13, 1, v22, v23);
    v14 = objc_claimAutoreleasedReturnValue();

LABEL_12:
    -[MTUserNotificationCenter dismissNotificationsWithIdentifiers:](self, "dismissNotificationsWithIdentifiers:", v14);
    goto LABEL_13;
  }
  MTLogForCategory(3);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[MTUserNotificationCenter dismissNotificationsForAlarm:includeMainIdentifier:includeSnooze:].cold.1((uint64_t)self, v14, v15, v16, v17, v18, v19, v20);
LABEL_13:

}

- (void)dismissNotificationsWithIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  MTUserNotificationCenter *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543618;
    v7 = self;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing notifications with identifiers %{public}@", (uint8_t *)&v6, 0x16u);
  }

  -[MTUserNotificationCenter tearDownNotificationsForEventIdentifiers:](self, "tearDownNotificationsForEventIdentifiers:", v4);
  +[MTCFUserNotificationPoster cancelNotificationsWithIdentifiers:](MTCFUserNotificationPoster, "cancelNotificationsWithIdentifiers:", v4);

}

- (void)tearDownNotificationsForEventIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  MTUserNotificationCenter *v10;
  uint8_t buf[4];
  MTUserNotificationCenter *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v12 = self;
    v13 = 2114;
    v14 = v4;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ tearDownNotificationsForEventIdentifiers %{public}@", buf, 0x16u);
  }

  -[NSDictionary allValues](self->_notificationCenters, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__MTUserNotificationCenter_tearDownNotificationsForEventIdentifiers___block_invoke;
  v8[3] = &unk_1E39CD9C0;
  v9 = v4;
  v10 = self;
  v7 = v4;
  objc_msgSend(v6, "na_each:", v8);

}

void __69__MTUserNotificationCenter_tearDownNotificationsForEventIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__MTUserNotificationCenter_tearDownNotificationsForEventIdentifiers___block_invoke_2;
  v7[3] = &unk_1E39CD998;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8 = v4;
  v9 = v5;
  v10 = v3;
  v6 = v3;
  objc_msgSend(v6, "getDeliveredNotificationsWithCompletionHandler:", v7);

}

void __69__MTUserNotificationCenter_tearDownNotificationsForEventIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__MTUserNotificationCenter_tearDownNotificationsForEventIdentifiers___block_invoke_3;
  v8[3] = &unk_1E39CD950;
  v9 = *(id *)(a1 + 32);
  objc_msgSend(a2, "na_filter:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_map:", &__block_literal_global_28);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  MTLogForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v11 = v7;
    v12 = 2114;
    v13 = v5;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Tearing down %{public}@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 48), "removeDeliveredNotificationsWithIdentifiers:", v5);
}

uint64_t __69__MTUserNotificationCenter_tearDownNotificationsForEventIdentifiers___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  objc_msgSend(a2, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mtStringByRemovingNotificationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__MTUserNotificationCenter_tearDownNotificationsForEventIdentifiers___block_invoke_4;
  v10[3] = &unk_1E39CB6D0;
  v11 = v5;
  v7 = v5;
  v8 = objc_msgSend(v6, "na_any:", v10);

  return v8;
}

uint64_t __69__MTUserNotificationCenter_tearDownNotificationsForEventIdentifiers___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "mtStringByRemovingNotificationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

id __69__MTUserNotificationCenter_tearDownNotificationsForEventIdentifiers___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)postNotificationForScheduledTimer:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id location;
  uint8_t buf[4];
  MTUserNotificationCenter *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MTLogForCategory(4);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v24 = self;
    v25 = 2114;
    v26 = v6;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ firing %{public}@", buf, 0x16u);
  }

  objc_msgSend(v6, "scheduleable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sound");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "interruptAudio");

  if (v11)
  {
    -[MTUserNotificationCenter interruptAudioAndLockDeviceWithCompletionBlock:](self, "interruptAudioAndLockDeviceWithCompletionBlock:", v7);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "contentForScheduledTimer:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CEC740];
    objc_msgSend(v9, "timerIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "requestWithIdentifier:content:trigger:destinations:", v14, v12, 0, -[MTUserNotificationCenter conditionalAlertDestination](self, "conditionalAlertDestination") | 0xA);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    kdebug_trace();
    MTLogForCategory(4);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v24 = self;
      v25 = 2114;
      v26 = v15;
      _os_log_impl(&dword_19AC4E000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ adding request %{public}@", buf, 0x16u);
    }

    -[MTUserNotificationCenter _notificationCenterForScheduledTimer](self, "_notificationCenterForScheduledTimer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __78__MTUserNotificationCenter_postNotificationForScheduledTimer_completionBlock___block_invoke;
    v18[3] = &unk_1E39CD928;
    objc_copyWeak(&v21, &location);
    v19 = v9;
    v20 = v7;
    objc_msgSend(v17, "addNotificationRequest:withCompletionHandler:", v15, v18);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
}

void __78__MTUserNotificationCenter_postNotificationForScheduledTimer_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v3)
  {
    MTLogForCategory(4);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "timerID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543874;
      v11 = WeakRetained;
      v12 = 2114;
      v13 = v9;
      v14 = 2114;
      v15 = v3;
      _os_log_error_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_ERROR, "%{public}@ failed to fire %{public}@ with error %{public}@", (uint8_t *)&v10, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to post timer user notifiation"));
    v6 = objc_claimAutoreleasedReturnValue();
    +[MTAnalytics sendCriticalEvent:](MTAnalytics, "sendCriticalEvent:", v6);
  }
  else
  {
    kdebug_trace();
    MTLogForCategory(4);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "timerID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = WeakRetained;
      v12 = 2114;
      v13 = v7;
      _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ fired %{public}@", (uint8_t *)&v10, 0x16u);

    }
  }

  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(void))(v8 + 16))();

}

- (id)_notificationCenterForScheduledTimer
{
  return -[NSDictionary objectForKeyedSubscript:](self->_notificationCenters, "objectForKeyedSubscript:", CFSTR("com.apple.mobiletimer"));
}

- (void)interruptAudioAndLockDeviceWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D519E8], "mtMainThreadScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__MTUserNotificationCenter_interruptAudioAndLockDeviceWithCompletionBlock___block_invoke;
  v7[3] = &unk_1E39CB880;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

uint64_t __75__MTUserNotificationCenter_interruptAudioAndLockDeviceWithCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void (*v8)(uint64_t, _QWORD);
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  __int128 buf;
  void *(*v19)(uint64_t);
  void *v20;
  uint64_t *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(getTUCallCenterClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentCallCount");

  if (!v3
    || v3 == 1
    && (objc_msgSend(getTUCallCenterClass(), "sharedInstance"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "incomingCall"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    MTLogForCategory(4);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ interrupting audio", (uint8_t *)&buf, 0xCu);
    }

    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v8 = (void (*)(uint64_t, _QWORD))getMRMediaRemoteSendCommandSymbolLoc_ptr;
    v17 = getMRMediaRemoteSendCommandSymbolLoc_ptr;
    if (!getMRMediaRemoteSendCommandSymbolLoc_ptr)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v19 = __getMRMediaRemoteSendCommandSymbolLoc_block_invoke;
      v20 = &unk_1E39CB690;
      v21 = &v14;
      __getMRMediaRemoteSendCommandSymbolLoc_block_invoke((uint64_t)&buf);
      v8 = (void (*)(uint64_t, _QWORD))v15[3];
    }
    _Block_object_dispose(&v14, 8);
    if (!v8)
      __75__MTUserNotificationCenter_interruptAudioAndLockDeviceWithCompletionBlock___block_invoke_cold_1();
    v8(1, 0);
    MTLogForCategory(4);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ locking device", (uint8_t *)&buf, 0xCu);
    }

    SBSLockDevice();
  }
  else
  {
    MTLogForCategory(4);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_19AC4E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ not interrupting audio or locking device because we're in a call", (uint8_t *)&buf, 0xCu);
    }

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t))(result + 16))(result);
  return result;
}

- (void)dismissNotificationsForTimer:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  MTUserNotificationCenter *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v17 = self;
    v18 = 2114;
    v19 = v4;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing %{public}@", buf, 0x16u);
  }

  if (v4)
  {
    -[MTUserNotificationCenter _notificationCenterForScheduledTimer](self, "_notificationCenterForScheduledTimer");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timerIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject removeDeliveredNotificationsWithIdentifiers:](v6, "removeDeliveredNotificationsWithIdentifiers:", v8);

  }
  else
  {
    MTLogForCategory(4);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MTUserNotificationCenter dismissNotificationsForTimer:].cold.1((uint64_t)self, v6, v9, v10, v11, v12, v13, v14);
  }

}

+ (id)requestIdentifierForScheduledAlarm:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "scheduleable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alarmIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "trigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isForGoToBed");

  if (v8)
  {
    objc_msgSend(a1, "_goToBedIdentifier:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v12 = (void *)v9;

    v6 = v12;
    goto LABEL_6;
  }
  objc_msgSend(v4, "trigger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "triggerType");

  if (v11 == 6)
  {
    objc_msgSend(a1, "_snoozeCountdownIdentifier:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(v4, "trigger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "triggerDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mtStringByAppendingNotificationDate:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_goToBedIdentifier:(id)a3
{
  return (id)objc_msgSend(CFSTR("MTBedtimeAlarm"), "stringByAppendingString:", a3);
}

+ (id)_snoozeCountdownIdentifier:(id)a3
{
  return (id)objc_msgSend(CFSTR("MTSnoozeCountdown"), "stringByAppendingString:", a3);
}

+ (id)notificationPrefixes
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("MTBedtimeAlarm");
  v3[1] = CFSTR("MTSnoozeCountdown");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)contentForScheduledAlarm:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_mutableContentForScheduledAlarmWithCommonSettings:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setSpecificContent:forScheduledAlarm:", v5, v4);

  return v5;
}

+ (id)_mutableContentForScheduledAlarmWithCommonSettings:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend((id)objc_opt_class(), "categoryForScheduledAlarm:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCategoryIdentifier:", v5);

  v6 = (void *)objc_opt_class();
  objc_msgSend(v3, "scheduleable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isSleepAlarm"))
    v8 = CFSTR("clock-sleep-alarm");
  else
    v8 = CFSTR("clock-alarm");
  objc_msgSend(v6, "launchURLForScheme:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultActionURL:", v9);

  objc_msgSend((id)objc_opt_class(), "userInfoForAlarm:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setUserInfo:", v10);
  return v4;
}

+ (void)_setSpecificContent:(id)a3 forScheduledAlarm:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(v6, "trigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isForGoToBed");

  if (v8)
  {
    objc_msgSend(a1, "_setSpecificContent:forGoToBedNotification:", v11, v6);
  }
  else
  {
    objc_msgSend(v6, "trigger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "triggerType");

    if (v10 == 6)
      objc_msgSend(a1, "_setSpecificContent:forSnoozeCountdownNotification:", v11, v6);
    else
      objc_msgSend(a1, "_setSpecificContent:forNormalScheduledAlarm:", v11, v6);
  }

}

+ (void)_setSpecificContent:(id)a3 forGoToBedNotification:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v6 = a3;
  objc_msgSend(a1, "_setGoToBedTitleAndBody:forGoToBedNotification:", v6, a4);
  +[MTSound defaultSoundForCategory:](MTSound, "defaultSoundForCategory:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unSoundForCategory:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSound:", v8);

  +[MTUserDefaults sharedUserDefaults](MTUserDefaults, "sharedUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerForKey:defaultValue:", CFSTR("MTBedtimeExpirationDuration"), 90);

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)(60 * v10));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExpirationDate:", v11);

}

+ (void)_setSpecificContent:(id)a3 forSnoozeCountdownNotification:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_setSnoozeCountdownTitleAndBody:forSnoozeCountdownNotification:", v7, v6);
  objc_msgSend(v7, "setShouldSuppressScreenLightUp:", 1);
  objc_msgSend(v7, "setShouldPreventNotificationDismissalAfterDefaultAction:", 1);
  objc_msgSend(v7, "setShouldIgnoreDoNotDisturb:", 1);
  objc_msgSend(v6, "trigger");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "triggerDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExpirationDate:", v8);

}

+ (void)_setSpecificContent:(id)a3 forNormalScheduledAlarm:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a3;
  objc_msgSend(a4, "scheduleable");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBody:", v6);

  objc_msgSend(v10, "sound");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isSleepAlarm"))
    v8 = 3;
  else
    v8 = 0;
  objc_msgSend(v7, "unSoundForCategory:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSound:", v9);

  objc_msgSend(v5, "setShouldIgnoreDoNotDisturb:", 1);
  objc_msgSend(v5, "setShouldBackgroundDefaultAction:", 1);
  objc_msgSend(v5, "setShouldPreemptPresentedNotification:", 1);

}

+ (id)_durationComponentsFormatter
{
  if (_durationComponentsFormatter_onceToken != -1)
    dispatch_once(&_durationComponentsFormatter_onceToken, &__block_literal_global_60);
  return (id)_durationComponentsFormatter_theDurationFormatter;
}

uint64_t __56__MTUserNotificationCenter__durationComponentsFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_durationComponentsFormatter_theDurationFormatter;
  _durationComponentsFormatter_theDurationFormatter = v0;

  objc_msgSend((id)_durationComponentsFormatter_theDurationFormatter, "setUnitsStyle:", 3);
  return objc_msgSend((id)_durationComponentsFormatter_theDurationFormatter, "setAllowedUnits:", 96);
}

+ (id)_timeFormatter
{
  if (_timeFormatter_onceToken != -1)
    dispatch_once(&_timeFormatter_onceToken, &__block_literal_global_62);
  return (id)_timeFormatter__timeFormatter;
}

uint64_t __42__MTUserNotificationCenter__timeFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_timeFormatter__timeFormatter;
  _timeFormatter__timeFormatter = v0;

  return objc_msgSend((id)_timeFormatter__timeFormatter, "setTimeStyle:", 1);
}

+ (void)_setGoToBedTitleAndBody:(id)a3 forGoToBedNotification:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = (void *)MEMORY[0x1E0CB34D0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("TIME_FOR_BED_TITLE"), &stru_1E39CF258, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v10);

  objc_msgSend(v7, "scheduleable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_wakeUpAlarmStringForAlarm:", v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setBody:", v12);
}

+ (id)_wakeUpAlarmStringForAlarm:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  if (objc_msgSend(v4, "isEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateFromComponents:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_timeFormatter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringFromDate:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("TIME_FOR_BED_ALARM_ON_MESSAGE_FORMAT"));
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "mtDateRequiresSingularTimeString:", v7);

    if (v12)
      objc_msgSend(v10, "appendString:", CFSTR("_SINGULAR"));
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", v10, &stru_1E39CF258, CFSTR("Localizable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v14, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("TIME_FOR_BED_ALARM_OFF_MESSAGE"), &stru_1E39CF258, CFSTR("Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

+ (void)_setSnoozeCountdownTitleAndBody:(id)a3 forSnoozeCountdownNotification:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB34D0];
  v5 = a3;
  objc_msgSend(v4, "bundleForClass:", objc_opt_class());
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ALARM_SNOOZING_TITLE"), &stru_1E39CF258, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

}

+ (id)contentForScheduledTimer:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "scheduleable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "displayTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBody:", v6);

  objc_msgSend(v4, "sound");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unSoundForCategory:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSound:", v8);

  objc_msgSend((id)objc_opt_class(), "categoryForScheduledTimer:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCategoryIdentifier:", v9);

  objc_msgSend(v5, "setShouldIgnoreDoNotDisturb:", 1);
  objc_msgSend((id)objc_opt_class(), "launchURLForScheme:", CFSTR("clock-timer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDefaultActionURL:", v10);

  objc_msgSend((id)objc_opt_class(), "userInfoForTimer:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setUserInfo:", v11);
  objc_msgSend(v5, "setShouldBackgroundDefaultAction:", 1);
  objc_msgSend(v5, "setShouldPreemptPresentedNotification:", 1);

  return v5;
}

+ (id)categoryForScheduledAlarm:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  __CFString **v8;
  __CFString **v9;
  __CFString **v10;
  __CFString *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "trigger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "triggerType");

  switch(v5)
  {
    case 0:
    case 1:
      objc_msgSend(v3, "scheduleable");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "allowsSnooze");
      v8 = MTAlarmCategory;
      v9 = MTAlarmNoSnoozeCategory;
      goto LABEL_5;
    case 2:
    case 3:
      v10 = MTBedtimeAlarmCategory;
      goto LABEL_11;
    case 4:
    case 5:
      objc_msgSend(v3, "scheduleable");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "allowsSnooze");
      v8 = MTWakeUpAlarmCategory;
      v9 = MTWakeUpAlarmNoSnoozeCategory;
LABEL_5:
      if (!v7)
        v8 = v9;
      v11 = *v8;

      goto LABEL_12;
    case 6:
      v10 = MTSnoozeAlarmCountdownCategory;
LABEL_11:
      v11 = *v10;
      goto LABEL_12;
    case 7:
    case 8:
      objc_msgSend(v3, "trigger");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Unexpected trigger type %ld for scheduled alarm %@"), objc_msgSend(v12, "triggerType"), v3);

      goto LABEL_9;
    default:
LABEL_9:
      v11 = 0;
LABEL_12:

      return v11;
  }
}

+ (id)categoryForScheduledTimer:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;

  v3 = a3;
  objc_msgSend(v3, "trigger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "triggerType");

  if ((unint64_t)(v5 - 1) >= 8)
  {
    if (!v5)
    {
      v7 = CFSTR("MTTimerCategory");
      goto LABEL_4;
    }
  }
  else
  {
    objc_msgSend(v3, "trigger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Unexpected trigger type %ld for scheduled timer %@"), objc_msgSend(v6, "triggerType"), v3);

  }
  v7 = 0;
LABEL_4:

  return v7;
}

+ (id)userInfoForAlarm:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "trigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "triggerDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("MTScheduledFireDate"));
  objc_msgSend(v3, "trigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isScheduled") & 1) != 0)
  {
    objc_msgSend(v3, "scheduleable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "allowsSnooze");

    if (v9)
      objc_msgSend(v4, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("MTSnoozeable"));
  }
  else
  {

  }
  v20 = &unk_1E3A05D68;
  objc_msgSend(v3, "scheduleable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "alarmIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v13 = (_QWORD *)getBLTBulletinContextKeyWatchLegacyMapKeySymbolLoc_ptr;
  v19 = getBLTBulletinContextKeyWatchLegacyMapKeySymbolLoc_ptr;
  if (!getBLTBulletinContextKeyWatchLegacyMapKeySymbolLoc_ptr)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __getBLTBulletinContextKeyWatchLegacyMapKeySymbolLoc_block_invoke;
    v15[3] = &unk_1E39CB690;
    v15[4] = &v16;
    __getBLTBulletinContextKeyWatchLegacyMapKeySymbolLoc_block_invoke((uint64_t)v15);
    v13 = (_QWORD *)v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (!v13)
    +[MTUserNotificationCenter userInfoForAlarm:].cold.1();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, *v13);

  return v4;
}

+ (id)userInfoForTimer:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "scheduleable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "duration");
  objc_msgSend(v5, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("MTTimerDuration"));

  objc_msgSend(v3, "scheduleable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "length"))
    goto LABEL_4;
  objc_msgSend(v3, "scheduleable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("CURRENT_TIMER"));

  if ((v12 & 1) == 0)
  {
    objc_msgSend(v3, "scheduleable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("MTTimerUserTitle"));
LABEL_4:

  }
  return v4;
}

+ (id)launchURLForScheme:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), a3, CFSTR("default"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)removeAllDeliveredNotifications
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  MTUserNotificationCenter *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ removing all delivered notifications.", (uint8_t *)&v6, 0xCu);
  }

  -[MTUserNotificationCenter notificationCenters](self, "notificationCenters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_each:", &__block_literal_global_89);

}

uint64_t __59__MTUserNotificationCenter_removeAllDeliveredNotifications__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllDeliveredNotifications");
}

- (void)postBedtimeNotificationForAlarm:(id)a3 date:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  +[MTTrigger triggerWithDate:triggerType:](MTTrigger, "triggerWithDate:triggerType:", a4, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTScheduledObject scheduledObjectForScheduleable:trigger:](MTScheduledObject, "scheduledObjectForScheduleable:trigger:", v6, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[MTUserNotificationCenter postNotificationForScheduledAlarm:completionBlock:](self, "postNotificationForScheduledAlarm:completionBlock:", v8, 0);
}

- (NSDictionary)notificationCenters
{
  return self->_notificationCenters;
}

- (void)setNotificationCenters:(id)a3
{
  objc_storeStrong((id *)&self->_notificationCenters, a3);
}

- (MTUserNotificationActionDispatcher)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_storeStrong((id *)&self->_actionHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_notificationCenters, 0);
}

- (void)dismissNotificationsForAlarm:(uint64_t)a3 includeMainIdentifier:(uint64_t)a4 includeSnooze:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_19AC4E000, a2, a3, "%{public}@ alarm is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __75__MTUserNotificationCenter_interruptAudioAndLockDeviceWithCompletionBlock___block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Boolean MTMRMediaRemoteSendCommand(MRMediaRemoteCommand, CFDictionaryRef)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MTUserNotificationCenter.m"), 58, CFSTR("%s"), dlerror());

  __break(1u);
}

- (void)dismissNotificationsForTimer:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_19AC4E000, a2, a3, "%{public}@ timer is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)userInfoForAlarm:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getBLTBulletinContextKeyWatchLegacyMapKey(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MTUserNotificationCenter_Internal.h"), 17, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
