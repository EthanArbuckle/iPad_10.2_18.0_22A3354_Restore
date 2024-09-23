@implementation CAFServiceLogging

void __CAFServiceLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.caraccessoryframework", "CAFService");
  v1 = (void *)CAFServiceLogging_facility;
  CAFServiceLogging_facility = (uint64_t)v0;

}

@end
