@implementation FPDataSourceBaseQueue

void __FPDataSourceBaseQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.FileProvider.CollectionDataSource.queue", v2);
  v1 = (void *)FPDataSourceBaseQueue_updateQueue;
  FPDataSourceBaseQueue_updateQueue = (uint64_t)v0;

}

@end
