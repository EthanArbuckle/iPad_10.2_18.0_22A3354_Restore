@implementation WBSAnalyticsLogger(SettingsAnalyticsLogger)

- (void)_settingsAnalyticsLogger_updatePeriodicCoreAnalyticsLastReportTime
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setDouble:forKey:", CFSTR("LastPeriodicSettingsReportTime"), CFAbsoluteTimeGetCurrent());

}

- (void)_performNewTabBehaviorReport
{
  void *v0;
  int v1;
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", *MEMORY[0x1E0D4F1C0]);

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  if (v1)
    v3 = 0;
  else
    v3 = 5;
  objc_msgSend(v2, "reportNewTabBehavior:", v3);

}

- (void)schedulePeriodicSettingsReport
{
  dispatch_time_t WeeklyAnalyticsReportForKey;
  _QWORD block[5];

  WeeklyAnalyticsReportForKey = WBSTimeUntilNextWeeklyAnalyticsReportForKey();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__WBSAnalyticsLogger_SettingsAnalyticsLogger__schedulePeriodicSettingsReport__block_invoke;
  block[3] = &unk_1E9CF1900;
  block[4] = a1;
  dispatch_after(WeeklyAnalyticsReportForKey, MEMORY[0x1E0C80D38], block);
}

@end
