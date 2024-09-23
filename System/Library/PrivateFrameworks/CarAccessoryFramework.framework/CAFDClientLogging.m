@implementation CAFDClientLogging

void __CAFDClientLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.caraccessoryframework", "cafd-dataclient");
  v1 = (void *)CAFDClientLogging_facility;
  CAFDClientLogging_facility = (uint64_t)v0;

}

@end
