@implementation CALNResourceChangedNotificationDataSourceUtils

+ (id)expirationDateForNotification:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;

  v3 = a3;
  if (objc_msgSend(v3, "changeType") == 3 || objc_msgSend(v3, "changeType") == 4)
  {
    v4 = (void *)MEMORY[0x24BDBCE60];
  }
  else
  {
    objc_msgSend(v3, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = (void *)MEMORY[0x24BDBCE60];
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "CalSimulatedDateForNow");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "endDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceDate:", v8);
      v11 = v10;

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dateByAddingTimeInterval:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "dateByAddingTimeInterval:", 86400.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_5;
    }
  }
  objc_msgSend(v4, "distantFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

  return v5;
}

+ (id)launchURLForNotification:(id)a3 inEventStore:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "resourceChangeFromEventStore:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendarItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKLaunchURLForEvent();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
