@implementation HKSPSleepStore(MobileTimerUIAdditions)

- (id)mt_sleepMetaDataForUpcomingAlarmInCalendar:()MobileTimerUIAdditions error:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v29;
  uint64_t v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v30 = 0;
  objc_msgSend(MEMORY[0x24BDBCE60], "mtNow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(a1, "upcomingResolvedScheduleOccurrenceAfterDate:alarmStatus:error:", v8, &v30, &v29);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v29;

  MTLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!a4)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v32 = a1;
      v33 = 2114;
      v34 = v9;
      _os_log_impl(&dword_2279B4000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ upcoming sleep occurrence: %{public}@", buf, 0x16u);
    }

    objc_msgSend(v9, "occurrence");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "wakeUpComponents");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlarmComponents:", v16);

    switch(v30)
    {
      case 0:
        objc_msgSend(v7, "setDisplaysTime:", 0);
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.MobileTimerUI"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("SLEEP_ALARM_NONE"), &stru_24F014C90, CFSTR("MobileTimerUI_Burrito"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setMainDescription:", v18);

        goto LABEL_13;
      case 1:
        objc_msgSend(v7, "setDisplaysTime:", 0);
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.MobileTimerUI"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("SLEEP_ALARM_SKIPPED"), &stru_24F014C90, CFSTR("MobileTimerUI_Burrito"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setMainDescription:", v20);

        goto LABEL_11;
      case 2:
        objc_msgSend(v7, "setDisplaysTime:", 1);
LABEL_11:
        v21 = objc_opt_class();
        objc_msgSend(v9, "wakeUpEvent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dueDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)v21;
        v23 = v14;
        v24 = v6;
        v25 = 1;
        goto LABEL_14;
      case 3:
        objc_msgSend(v7, "setDisplaysTime:", 1);
LABEL_13:
        v26 = objc_opt_class();
        objc_msgSend(v9, "wakeUpEvent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dueDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)v26;
        v23 = v14;
        v24 = v6;
        v25 = 0;
LABEL_14:
        objc_msgSend(v22, "mt_getDetailedAlarmTitleForDate:calendar:onlyAppliesOnce:", v23, v24, v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setDetailedDescription:", v27);

        goto LABEL_15;
      default:
        goto LABEL_16;
    }
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[HKSPSleepStore(MobileTimerUIAdditions) mt_sleepMetaDataForUpcomingAlarmInCalendar:error:].cold.1((uint64_t)a1, (uint64_t)v10, v12);

  objc_msgSend(v7, "setDisplaysTime:", 0);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.MobileTimerUI"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SLEEP_ALARM_NONE"), &stru_24F014C90, CFSTR("MobileTimerUI_Burrito"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMainDescription:", v14);
LABEL_15:

LABEL_16:
  return v7;
}

+ (id)mt_getDetailedAlarmTitleForDate:()MobileTimerUIAdditions calendar:onlyAppliesOnce:
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  int v22;
  id v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "hksp_dayPeriodForDate:locale:", v7, v9);

    MTLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138543618;
      v23 = v7;
      v24 = 2048;
      v25 = v10;
      _os_log_impl(&dword_2279B4000, v11, OS_LOG_TYPE_DEFAULT, "wake up date is %{public}@ and time of the day enum is %lu", (uint8_t *)&v22, 0x16u);
    }

    v12 = objc_msgSend(v8, "isDateInToday:", v7);
    v13 = objc_msgSend(v8, "isDateInTomorrow:", v7);
    if ((v12 & 1) == 0 && !v13)
    {
      v14 = objc_alloc_init(MEMORY[0x24BDD1500]);
      objc_msgSend(v14, "setDateFormat:", CFSTR("EEEE"));
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setLocale:", v15);

      objc_msgSend(v14, "stringFromDate:", v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      MTLogForCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v22 = 138412290;
        v23 = v16;
        _os_log_impl(&dword_2279B4000, v17, OS_LOG_TYPE_DEFAULT, "wake up day of the week is %@", (uint8_t *)&v22, 0xCu);
      }
      goto LABEL_18;
    }
    v18 = (void *)objc_opt_new();
    v14 = v18;
    if (v12)
      v19 = CFSTR("TODAY_");
    else
      v19 = CFSTR("TOMORROW_");
    objc_msgSend(v18, "appendString:", v19);
    if ((a5 & 1) != 0)
    {
      v20 = CFSTR("ONLY");
    }
    else
    {
      if ((unint64_t)(v10 - 1) > 2)
      {
LABEL_17:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.MobileTimerUI"));
        v17 = objc_claimAutoreleasedReturnValue();
        -[NSObject localizedStringForKey:value:table:](v17, "localizedStringForKey:value:table:", v14, &stru_24F014C90, CFSTR("MobileTimerUI_Burrito"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

        goto LABEL_19;
      }
      v20 = off_24F014710[v10 - 1];
    }
    objc_msgSend(v14, "appendString:", v20);
    goto LABEL_17;
  }
  v16 = 0;
LABEL_19:

  return v16;
}

- (void)mt_sleepMetaDataForUpcomingAlarmInCalendar:()MobileTimerUIAdditions error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_2279B4000, log, OS_LOG_TYPE_ERROR, "%{public}@ failed to retrieve upcoming sleep occurrence with error: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
