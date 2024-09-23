@implementation LPLogChannelVideo

void __LPLogChannelVideo_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LinkPresentation", "Video");
  v1 = (void *)LPLogChannelVideo_log;
  LPLogChannelVideo_log = (uint64_t)v0;

}

@end
