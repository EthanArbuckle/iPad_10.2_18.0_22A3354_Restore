@implementation NPKNotificationForExpressPassConfigurationChange

void __NPKNotificationForExpressPassConfigurationChange_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, "NPKExpressPassConfigurations", (CFNotificationCallback)ExpressPassesInformationDidChange, CFSTR("com.apple.nanopassbook.expresspassconfigurationschanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

@end
