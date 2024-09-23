@implementation PFCloudKitImporterOptions

- (PFCloudKitImporterOptions)initWithOptions:(id)a3 monitor:(id)a4 assetStorageURL:(id)a5 workQueue:(id)a6 andDatabase:(id)a7
{
  PFCloudKitImporterOptions *v12;
  NSObject *workQueue;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PFCloudKitImporterOptions;
  v12 = -[PFCloudKitImporterOptions init](&v15, sel_init);
  if (v12)
  {
    v12->_options = (NSCloudKitMirroringDelegateOptions *)objc_msgSend(a3, "copy");
    v12->_database = (CKDatabase *)a7;
    v12->_monitor = (PFCloudKitStoreMonitor *)a4;
    v12->_workQueue = (OS_dispatch_queue *)a6;
    v12->_assetStorageURL = (NSURL *)a5;
    workQueue = v12->_workQueue;
    if (workQueue)
      dispatch_retain(workQueue);
  }
  return v12;
}

- (void)dealloc
{
  NSObject *workQueue;
  objc_super v4;

  workQueue = self->_workQueue;
  if (workQueue)
    dispatch_release(workQueue);

  v4.receiver = self;
  v4.super_class = (Class)PFCloudKitImporterOptions;
  -[PFCloudKitImporterOptions dealloc](&v4, sel_dealloc);
}

- (id)copy
{
  return -[PFCloudKitImporterOptions initWithOptions:monitor:assetStorageURL:workQueue:andDatabase:]([PFCloudKitImporterOptions alloc], "initWithOptions:monitor:assetStorageURL:workQueue:andDatabase:", self->_options, self->_monitor, self->_assetStorageURL, self->_workQueue, self->_database);
}

@end
