@implementation AXInCheckerBoardScenario

void __AXInCheckerBoardScenario_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  id v1;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_handleInCheckerBoardModeUpdate, CFSTR("AXInternalInCheckerBoardModeUpdatedNotification"), 0, CFNotificationSuspensionBehaviorCoalesce);
  +[AXBackBoardServer server](AXBackBoardServer, "server");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  InCheckerBoardMode = objc_msgSend(v1, "inCheckerBoardMode");

}

@end
