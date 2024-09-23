@implementation CKMessageUnknownSenderNotificationDisabled

void __CKMessageUnknownSenderNotificationDisabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  sSMSDefaultAllowUnknownSendersDisabled = _CKLoadBooleanPrefWithNameAndDefaultValue(CFSTR("IncomingMessageAlertFiltrationUnknownSenders"), 0) != 0;
  if ((CKIsUnexpectedlyLoggedOutChanged_block_invoke_4_isListening & 1) == 0)
  {
    CKIsUnexpectedlyLoggedOutChanged_block_invoke_4_isListening = 1;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_CKMessageUnknownSenderNotificationDisabledChanged, CFSTR("com.apple.MobileSMS.IncomingMessageAlertFiltrationUnknownSenders.changed"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

@end
