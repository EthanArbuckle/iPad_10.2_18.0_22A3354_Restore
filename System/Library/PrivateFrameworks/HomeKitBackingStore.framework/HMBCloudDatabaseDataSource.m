@implementation HMBCloudDatabaseDataSource

- (void)performAfterDelay:(double)a3 block:(id)a4
{
  int64_t v4;
  id v5;
  dispatch_time_t v6;
  NSObject *v7;

  v4 = (uint64_t)(a3 * 1000000000.0);
  v5 = a4;
  v6 = dispatch_time(0, v4);
  dispatch_get_global_queue(21, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_after(v6, v7, v5);

}

@end
