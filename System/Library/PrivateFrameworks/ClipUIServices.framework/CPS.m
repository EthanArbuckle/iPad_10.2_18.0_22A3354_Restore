@implementation CPS

void __CPS_LOG_CHANNEL_PREFIXClipUIServices_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ClipUIServices", "ClipUIServices");
  v1 = (void *)CPS_LOG_CHANNEL_PREFIXClipUIServices_log;
  CPS_LOG_CHANNEL_PREFIXClipUIServices_log = (uint64_t)v0;

}

@end
