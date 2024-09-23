@implementation FCCKUserInfoKeys

id __FCCKUserInfoKeys_block_invoke()
{
  if (qword_1ED0F8060 != -1)
    dispatch_once(&qword_1ED0F8060, &__block_literal_global_1425);
  return (id)qword_1ED0F8058;
}

void __FCCKUserInfoKeys_block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("canonicalLanguage"), CFSTR("editorialArticleVersion"), CFSTR("feldsparID"), CFSTR("finishFirstLaunchVersion"), CFSTR("lastOpenedDate"), CFSTR("lastViewedSavedDate"), CFSTR("monthlyMeteredCount"), CFSTR("meteredCountLastResetDate"), CFSTR("monthlyPaidBundleMeteredCount"), CFSTR("paidBundleMeteredCountLastResetDate"), CFSTR("upsellAppLaunchCount"), CFSTR("lastAppLaunchUpsellInstanceID"), CFSTR("upsellAppLaunchLastSeenDate"), CFSTR("upsellAppLaunchLastShownCampaignID"), CFSTR("upsellAppLaunchLastPresenterBundleID"), CFSTR("newsletterSignupLastSeenDate"), CFSTR("personalizedNewsletterSignupLastSeenDate"),
    CFSTR("issuesNewsletterOptinLastSeenDate"),
    CFSTR("notificationsUserID"),
    CFSTR("marketingNotificationsEnabled"),
    CFSTR("newIssueNotificationsEnabled"),
    CFSTR("endOfAudioNotificationsEnabled"),
    CFSTR("sportsTopicNotificationsEnabledState2"),
    CFSTR("totalMeteredCount"),
    CFSTR("userStartDate"),
    CFSTR("adsUserID"),
    CFSTR("adsUserIDCreatedDate"),
    CFSTR("lastViewedSharedWithYouDate"),
    CFSTR("postPurchaseOnboardingLastSeenDate"),
    CFSTR("appReviewRequestLastSeenDate"),
    CFSTR("sportsOnboardingState"),
    CFSTR("sportsOnboardingCompletedDate"),
    CFSTR("sportsSyncState"),
    CFSTR("sportsSyncStateLastSavedDate"),
    CFSTR("shortcutsOnboardingState"),
    CFSTR("shortcutsOnboardingCompletedDate"),
    CFSTR("sportsUserID"),
    CFSTR("puzzleNotificationsEnabled2"),
    CFSTR("puzzleNotificationsLastChangedDate"),
    CFSTR("puzzleStatsStartDate"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F8058;
  qword_1ED0F8058 = v0;

}

@end
