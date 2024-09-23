@implementation CKMessageSpamFilteringEnabledUnderFirstUnlock

void __CKMessageSpamFilteringEnabledUnderFirstUnlock_block_invoke()
{
  void *v0;
  void *v1;
  int v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v4;

  +[CKUtilities imDefaultsSharedInstance](CKUtilities, "imDefaultsSharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (void *)CPCopySharedResourcesPreferencesDomainForDomain();
  sCheckForceSMSSpamFilteringCompleted = objc_msgSend(v4, "getBoolFromDomain:forKey:", v0, CFSTR("sForceSMSSpamFilteringCompleted"));
  sSMSSpamFilteringEnabled = objc_msgSend(v4, "getBoolFromDomain:forKey:", v0, CFSTR("IncomingMessageAlertSpamFiltration"));
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isSMSFilterSyncEnabled");

  if (v2)
    sCheckForceDisableSMSFilteringIpadCompleted = objc_msgSend(v4, "getBoolFromDomain:forKey:", v0, CFSTR("sForceDisableSMSFilteringIpadCompleted"));
  if ((CKMessageSpamFilteringChangedNotification_block_invoke_3_isListening & 1) == 0)
  {
    CKMessageSpamFilteringChangedNotification_block_invoke_3_isListening = 1;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_CKMessageSpamFilteringEnabledChanged, CFSTR("com.apple.MobileSMS.IncomingMessageAlertSpamFiltration.changed"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }

}

@end
