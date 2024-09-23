@implementation CAFControlLogging

void __CAFControlLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.caraccessoryframework", "CAFControl");
  v1 = (void *)CAFControlLogging_facility;
  CAFControlLogging_facility = (uint64_t)v0;

}

@end
