@implementation AXInPreboardScenario

void __AXInPreboardScenario_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v1;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_handleInPreBoardModeUpdate, CFSTR("AXInternalInPreBoardModeUpdatedNotification"), 0, CFNotificationSuspensionBehaviorCoalesce);
  AXPreBoardQueue();
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v1, &__block_literal_global_2);

}

void __AXInPreboardScenario_block_invoke_2()
{
  id v0;

  +[AXBackBoardServer server](AXBackBoardServer, "server");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  InPreBoardMode = objc_msgSend(v0, "inPreboardMode");

}

@end
