@implementation LPLogChannelFetching

void __LPLogChannelFetching_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LinkPresentation", "Fetching");
  v1 = (void *)LPLogChannelFetching_log;
  LPLogChannelFetching_log = (uint64_t)v0;

}

@end
