@implementation HKMCSettingsManager(NotificationTiming)

- (id)hdmc_dateComponentsForMenstruationNotificationOnDayIndex:()NotificationTiming
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "menstruationNotificationTimeOfDay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_hdmc_dateComponentsForNotificationOnDayIndex:timeOfDay:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)hdmc_dateComponentsForFertileWindowNotificationOnDayIndex:()NotificationTiming
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "fertileWindowNotificationTimeOfDay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_hdmc_dateComponentsForNotificationOnDayIndex:timeOfDay:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_hdmc_dateComponentsForNotificationOnDayIndex:()NotificationTiming timeOfDay:
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v5 = (void *)MEMORY[0x24BDBCE68];
  v6 = (void *)MEMORY[0x24BDBCE48];
  v7 = a4;
  objc_msgSend(v6, "hk_gregorianCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_componentsWithDayIndex:calendar:", a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hk_translateDateComponentsToCalendar:calendarUnits:", v10, 30);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setHour:", objc_msgSend(v7, "hour"));
  v12 = objc_msgSend(v7, "minute");

  objc_msgSend(v11, "setMinute:", v12);
  return v11;
}

- (id)hdmc_nextAnalysisSchedulingWindowStartDateAfterDate:()NotificationTiming calendar:
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_hdmc_analysisSchedulingWindowStartComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nextDateAfterDate:matchingComponents:options:", v7, v8, 1024);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_hdmc_analysisSchedulingWindowStartComponents
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  objc_msgSend(MEMORY[0x24BDBCE68], "hk_componentsWithHour:minute:", 18, 30);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppleInternalInstall");

  if (v4)
  {
    objc_msgSend(a1, "fertileWindowNotificationTimeOfDay");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "calendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "nextDateAfterDate:matchingComponents:options:", v10, v5, 1024);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dateByAddingTimeInterval:", -5400.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "components:fromDate:", 96, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v13;
  }
  return v2;
}

@end
