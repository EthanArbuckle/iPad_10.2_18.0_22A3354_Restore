@implementation IMCloudKitSyncProgressRuntimeTestDownloading

- (void)willUpdateSyncState:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setIMCloudKitSyncDate:", 0);
  objc_msgSend(v3, "setIMCloudKitSyncControllerSyncState:", 2);
  objc_msgSend(v3, "setIMCloudKitSyncControllerSyncRecordType:", 1);

}

@end
