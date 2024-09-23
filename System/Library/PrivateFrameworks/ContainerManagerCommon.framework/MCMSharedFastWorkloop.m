@implementation MCMSharedFastWorkloop

void __MCMSharedFastWorkloop_block_invoke()
{
  dispatch_workloop_t v0;
  void *v1;

  v0 = dispatch_workloop_create("com.apple.containermanagerd.fast");
  v1 = (void *)MCMSharedFastWorkloop_fastWorkloop;
  MCMSharedFastWorkloop_fastWorkloop = (uint64_t)v0;

}

@end
