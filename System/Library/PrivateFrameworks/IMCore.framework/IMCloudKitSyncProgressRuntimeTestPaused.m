@implementation IMCloudKitSyncProgressRuntimeTestPaused

- (void)willUpdateSyncState:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setIMCloudKitSyncDate:", 0);
  objc_msgSend(v3, "setIMCloudKitSyncPaused:", 1);
  objc_msgSend(v3, "setIMCloudKitIsSyncing:", 0);

}

@end
