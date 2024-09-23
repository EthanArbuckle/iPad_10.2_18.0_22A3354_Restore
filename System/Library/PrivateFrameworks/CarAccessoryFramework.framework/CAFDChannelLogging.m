@implementation CAFDChannelLogging

void __CAFDChannelLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.caraccessoryframework", "cafd-datachannel");
  v1 = (void *)CAFDChannelLogging_facility;
  CAFDChannelLogging_facility = (uint64_t)v0;

}

@end
