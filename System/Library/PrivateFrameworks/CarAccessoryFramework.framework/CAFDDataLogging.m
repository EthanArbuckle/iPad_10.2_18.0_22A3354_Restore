@implementation CAFDDataLogging

void __CAFDDataLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.caraccessoryframework", "cafd-dataAgent");
  v1 = (void *)CAFDDataLogging_facility;
  CAFDDataLogging_facility = (uint64_t)v0;

}

@end
