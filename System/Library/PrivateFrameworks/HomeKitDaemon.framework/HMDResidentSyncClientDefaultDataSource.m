@implementation HMDResidentSyncClientDefaultDataSource

- (void)performWithDelay:(unsigned int)a3 block:(id)a4
{
  int64_t v4;
  id v5;
  dispatch_time_t v6;
  NSObject *v7;

  v4 = 1000000000 * a3;
  v5 = a4;
  v6 = dispatch_time(0, v4);
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_after(v6, v7, v5);

}

@end
