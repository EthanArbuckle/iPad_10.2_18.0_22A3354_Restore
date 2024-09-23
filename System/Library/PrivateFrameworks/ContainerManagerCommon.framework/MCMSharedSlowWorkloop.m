@implementation MCMSharedSlowWorkloop

void __MCMSharedSlowWorkloop_block_invoke()
{
  dispatch_workloop_t v0;
  void *v1;

  v0 = dispatch_workloop_create("com.apple.containermanagerd.slow");
  v1 = (void *)MCMSharedSlowWorkloop_slowWorkloop;
  MCMSharedSlowWorkloop_slowWorkloop = (uint64_t)v0;

}

@end
