@implementation LPLogChannelPlugin

void __LPLogChannelPlugin_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LinkPresentation", "Plugin");
  v1 = (void *)LPLogChannelPlugin_log;
  LPLogChannelPlugin_log = (uint64_t)v0;

}

@end
