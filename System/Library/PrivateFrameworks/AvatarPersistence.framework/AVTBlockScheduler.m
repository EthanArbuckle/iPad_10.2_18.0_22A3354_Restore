@implementation AVTBlockScheduler

- (void)performBlock:(id)a3 afterDelay:(double)a4 onQueue:(id)a5
{
  int64_t v6;
  NSObject *v7;
  dispatch_time_t v8;
  dispatch_block_t block;

  v6 = (uint64_t)(a4 * 1000000000.0);
  v7 = a5;
  block = a3;
  v8 = dispatch_time(0, v6);
  dispatch_after(v8, v7, block);

}

@end
