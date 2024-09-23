@implementation WBSAnalyticsLogger(StandaloneTabBarAnalyticsLogger)

- (void)_standaloneTabBarAnalyticsLogger_updatePeriodicCoreAnalyticsLastReportTime
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setDouble:forKey:", CFSTR("LastPeriodicStandaloneTabBarReportTime"), CFAbsoluteTimeGetCurrent());

}

- (void)_performStandaloneTabBarReport
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reportShowStandaloneTabBarPreference:", objc_msgSend(v0, "BOOLForKey:", *MEMORY[0x1E0D4F128]));

}

- (void)schedulePeriodicStandaloneTabBarReport
{
  dispatch_time_t WeeklyAnalyticsReportForKey;
  _QWORD block[5];

  WeeklyAnalyticsReportForKey = WBSTimeUntilNextWeeklyAnalyticsReportForKey();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__WBSAnalyticsLogger_StandaloneTabBarAnalyticsLogger__schedulePeriodicStandaloneTabBarReport__block_invoke;
  block[3] = &unk_1E9CF1900;
  block[4] = a1;
  dispatch_after(WeeklyAnalyticsReportForKey, MEMORY[0x1E0C80D38], block);
}

@end
