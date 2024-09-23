@implementation CAFDataClientLogging

void __CAFDataClientLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.caraccessoryframework", "caf-dataclient");
  v1 = (void *)CAFDataClientLogging_facility;
  CAFDataClientLogging_facility = (uint64_t)v0;

}

@end
