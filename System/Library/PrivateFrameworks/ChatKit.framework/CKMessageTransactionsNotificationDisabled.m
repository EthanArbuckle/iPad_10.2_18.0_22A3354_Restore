@implementation CKMessageTransactionsNotificationDisabled

void __CKMessageTransactionsNotificationDisabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  sSMSDefaultAllowTransactionsDisabled = _CKLoadBooleanPrefWithNameAndDefaultValue(CFSTR("IncomingMessageAlertFiltrationTransactions"), 0) != 0;
  if ((CKIsUnexpectedlyLoggedOutChanged_block_invoke_5_isListening & 1) == 0)
  {
    CKIsUnexpectedlyLoggedOutChanged_block_invoke_5_isListening = 1;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_CKMessageTransactionsNotificationDisabledChanged, CFSTR("com.apple.MobileSMS.IncomingMessageAlertFiltrationTransactions.changed"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

@end
