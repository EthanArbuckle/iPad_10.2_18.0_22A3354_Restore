@implementation WBSAnalyticsLogger

uint64_t __79__WBSAnalyticsLogger_TabGroupsAnalyticsLogger__schedulePeriodicTabGroupsReport__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_performTabGroupsReport");
  objc_msgSend(*(id *)(a1 + 32), "_performTabsForNonTabGroupUserReport");
  objc_msgSend(*(id *)(a1 + 32), "_performSyncSuccessesCountReport");
  objc_msgSend(*(id *)(a1 + 32), "_tabGroupsAnalyticsLogger_updatePeriodicCoreAnalyticsLastReportTime");
  return objc_msgSend(*(id *)(a1 + 32), "schedulePeriodicTabGroupsReport");
}

uint64_t __77__WBSAnalyticsLogger_SettingsAnalyticsLogger__schedulePeriodicSettingsReport__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_performNewTabBehaviorReport");
  objc_msgSend(*(id *)(a1 + 32), "_settingsAnalyticsLogger_updatePeriodicCoreAnalyticsLastReportTime");
  return objc_msgSend(*(id *)(a1 + 32), "schedulePeriodicSettingsReport");
}

uint64_t __91__WBSAnalyticsLogger_PrivateBrowsingAnalyticsLogger__schedulePeriodicPrivateBrowsingReport__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_performPrivateBrowsingReport");
  objc_msgSend(*(id *)(a1 + 32), "_performAdvancedPrivacyProtectionPreferenceReport");
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDouble:forKey:", CFSTR("LastPeriodicPrivateBrowsingReportTime"), CFAbsoluteTimeGetCurrent());

  return objc_msgSend(*(id *)(a1 + 32), "schedulePeriodicPrivateBrowsingReport");
}

uint64_t __87__WBSAnalyticsLogger_BrowsingAssistantAnalyticsLogger__scheduleBrowsingAssistantReport__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_performUserConsentReport");
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDouble:forKey:", CFSTR("LastPeriodicBrowsingAssistantReportTime"), CFAbsoluteTimeGetCurrent());

  return objc_msgSend(*(id *)(a1 + 32), "scheduleBrowsingAssistantReport");
}

uint64_t __93__WBSAnalyticsLogger_StandaloneTabBarAnalyticsLogger__schedulePeriodicStandaloneTabBarReport__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_performStandaloneTabBarReport");
  objc_msgSend(*(id *)(a1 + 32), "_standaloneTabBarAnalyticsLogger_updatePeriodicCoreAnalyticsLastReportTime");
  return objc_msgSend(*(id *)(a1 + 32), "schedulePeriodicStandaloneTabBarReport");
}

@end
