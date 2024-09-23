@implementation NPKNotificationForExpressPassesInformationChange

void __NPKNotificationForExpressPassesInformationChange_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, "NPKExpressPassesInformation", (CFNotificationCallback)ExpressPassesInformationDidChange, CFSTR("com.apple.nanopassbook.expresspassesinformationchanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

@end
