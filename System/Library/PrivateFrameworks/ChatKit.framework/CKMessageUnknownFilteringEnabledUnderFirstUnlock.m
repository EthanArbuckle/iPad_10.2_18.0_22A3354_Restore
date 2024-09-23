@implementation CKMessageUnknownFilteringEnabledUnderFirstUnlock

void __CKMessageUnknownFilteringEnabledUnderFirstUnlock_block_invoke()
{
  void *v0;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v2;

  v2 = (id)CPCopySharedResourcesPreferencesDomainForDomain();
  +[CKUtilities imDefaultsSharedInstance](CKUtilities, "imDefaultsSharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  sCheckForceUnknownFilteringCompleted = objc_msgSend(v0, "getBoolFromDomain:forKey:", v2, CFSTR("sForceUnknownFilteringCompleted"));
  sUnknownFilteringEnabled = objc_msgSend(v0, "getBoolFromDomain:forKey:", v2, CFSTR("IncomingMessageAlertFiltration"));
  if ((CKMessageSpamFilteringChangedNotification_block_invoke_2_isListening & 1) == 0)
  {
    CKMessageSpamFilteringChangedNotification_block_invoke_2_isListening = 1;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_CKMessageFilteringEnabledChanged, CFSTR("com.apple.MobileSMS.IncomingMessageAlertFiltration.changed"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }

}

@end
