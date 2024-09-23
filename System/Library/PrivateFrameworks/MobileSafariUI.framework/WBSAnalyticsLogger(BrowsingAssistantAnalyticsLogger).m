@implementation WBSAnalyticsLogger(BrowsingAssistantAnalyticsLogger)

- (void)_performUserConsentReport
{
  void *v0;
  id v1;

  if (objc_msgSend(MEMORY[0x1E0D8A7F8], "isAvailableInCurrentLocale"))
  {
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D8A7F8], "userConsentState");
    WBSBrowsingAssistantConsentStateName();
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "reportUserConsentStateSBA:", v0);

  }
}

- (void)scheduleBrowsingAssistantReport
{
  dispatch_time_t WeeklyAnalyticsReportForKey;
  _QWORD block[5];

  WeeklyAnalyticsReportForKey = WBSTimeUntilNextWeeklyAnalyticsReportForKey();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__WBSAnalyticsLogger_BrowsingAssistantAnalyticsLogger__scheduleBrowsingAssistantReport__block_invoke;
  block[3] = &unk_1E9CF1900;
  block[4] = a1;
  dispatch_after(WeeklyAnalyticsReportForKey, MEMORY[0x1E0C80D38], block);
}

@end
