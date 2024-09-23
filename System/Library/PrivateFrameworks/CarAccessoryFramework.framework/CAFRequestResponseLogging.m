@implementation CAFRequestResponseLogging

void __CAFRequestResponseLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.caraccessoryframework", "CAFRequestResponse");
  v1 = (void *)CAFRequestResponseLogging_facility;
  CAFRequestResponseLogging_facility = (uint64_t)v0;

}

@end
