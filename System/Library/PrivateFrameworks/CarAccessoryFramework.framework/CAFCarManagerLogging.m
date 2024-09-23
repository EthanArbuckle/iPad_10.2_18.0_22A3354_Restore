@implementation CAFCarManagerLogging

void __CAFCarManagerLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.caraccessoryframework", "CAFCarManager");
  v1 = (void *)CAFCarManagerLogging_facility;
  CAFCarManagerLogging_facility = (uint64_t)v0;

}

@end
