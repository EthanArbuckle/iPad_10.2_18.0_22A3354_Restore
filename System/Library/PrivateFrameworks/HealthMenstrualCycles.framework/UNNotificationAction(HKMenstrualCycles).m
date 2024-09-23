@implementation UNNotificationAction(HKMenstrualCycles)

+ (id)hkmc_actionWithIdentifier:()HKMenstrualCycles
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  void *v12;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("OpenAddPeriodCalendar")))
  {
    v4 = (void *)MEMORY[0x24BDF8820];
    HKMCLocalizedString(CFSTR("NOTIFICATION_ACTION_TITLE_ADD_PERIOD"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    v7 = v3;
    v8 = v5;
    v9 = 4;
LABEL_8:
    objc_msgSend(v6, "actionWithIdentifier:title:options:", v7, v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("PeriodNotEnded")))
  {
    v10 = (void *)MEMORY[0x24BDF8820];
    v11 = CFSTR("NOTIFICATION_ACTION_TITLE_PERIOD_NOT_ENDED");
LABEL_7:
    HKMCLocalizedString(v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
    v7 = v3;
    v8 = v5;
    v9 = 1;
    goto LABEL_8;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("PeriodNotStarted")))
  {
    v10 = (void *)MEMORY[0x24BDF8820];
    v11 = CFSTR("NOTIFICATION_ACTION_TITLE_PERIOD_NOT_STARTED");
    goto LABEL_7;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("OpenPregnancyOnboarding")))
  {
    objc_msgSend(MEMORY[0x24BDF8820], "actionWithIdentifier:title:options:", v3, CFSTR("LOCALIZE ME: PREGNANCY ONBOARDING"), 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
LABEL_9:

  return v12;
}

@end
