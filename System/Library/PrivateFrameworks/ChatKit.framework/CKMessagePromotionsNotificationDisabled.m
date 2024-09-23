@implementation CKMessagePromotionsNotificationDisabled

void __CKMessagePromotionsNotificationDisabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  sSMSDefaultAllowPromotionsDisabled = _CKLoadBooleanPrefWithNameAndDefaultValue(CFSTR("IncomingMessageAlertFiltrationPromotions"), 0) != 0;
  if ((CKIsUnexpectedlyLoggedOutChanged_block_invoke_6_isListening & 1) == 0)
  {
    CKIsUnexpectedlyLoggedOutChanged_block_invoke_6_isListening = 1;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_CKMessagePromotionsNotificationDisabledChanged, CFSTR("com.apple.MobileSMS.IncomingMessageAlertFiltrationPromotions.changed"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

@end
