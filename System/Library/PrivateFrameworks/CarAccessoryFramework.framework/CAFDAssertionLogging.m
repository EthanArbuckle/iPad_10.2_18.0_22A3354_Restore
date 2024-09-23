@implementation CAFDAssertionLogging

void __CAFDAssertionLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.caraccessoryframework", "cafd-assertion");
  v1 = (void *)CAFDAssertionLogging_facility;
  CAFDAssertionLogging_facility = (uint64_t)v0;

}

@end
