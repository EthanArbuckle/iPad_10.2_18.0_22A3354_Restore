@implementation IMCloudKitSyncProgressRuntimeTestUploading

- (void)setUp
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMCloudKitSyncProgressRuntimeTestUploading;
  -[IMCloudKitSyncProgressRuntimeTest setUp](&v3, sel_setUp);
  -[IMCloudKitSyncProgressRuntimeTest setProgressRescheduleDelay:](self, "setProgressRescheduleDelay:", 0.0);
  -[IMCloudKitSyncProgressRuntimeTest setProgressCount:](self, "setProgressCount:", 0);
  -[IMCloudKitSyncProgressRuntimeTest setMaxProgressCount:](self, "setMaxProgressCount:", 5);
}

- (void)willUpdateSyncState:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setIMCloudKitSyncDate:", 0);
  objc_msgSend(v3, "setIMCloudKitSyncControllerSyncState:", 4);
  objc_msgSend(v3, "setIMCloudKitSyncControllerSyncRecordType:", 1);

}

@end
