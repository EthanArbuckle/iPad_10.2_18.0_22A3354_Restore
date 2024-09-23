@implementation IMCloudKitSyncProgressRuntimeTestPreparing

- (void)willUpdateSyncState:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setIMCloudKitSyncControllerSyncState:", 1);
  objc_msgSend(v3, "setIMCloudKitSyncControllerSyncRecordType:", 1);
  objc_msgSend(v3, "setIMCloudKitSyncDate:", 0);

}

@end
