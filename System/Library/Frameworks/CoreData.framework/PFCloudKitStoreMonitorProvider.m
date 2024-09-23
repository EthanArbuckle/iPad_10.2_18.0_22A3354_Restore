@implementation PFCloudKitStoreMonitorProvider

- (id)createMonitorForObservedStore:(id)result inTransactionWithLabel:(uint64_t)a2
{
  if (result)
    return -[PFCloudKitStoreMonitor initForStore:]([PFCloudKitStoreMonitor alloc], "initForStore:", a2);
  return result;
}

@end
