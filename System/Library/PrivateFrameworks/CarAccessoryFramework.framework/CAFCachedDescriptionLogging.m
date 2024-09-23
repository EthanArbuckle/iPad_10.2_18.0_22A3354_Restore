@implementation CAFCachedDescriptionLogging

void __CAFCachedDescriptionLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.caraccessoryframework", "CAFCachedDescription");
  v1 = (void *)CAFCachedDescriptionLogging_facility;
  CAFCachedDescriptionLogging_facility = (uint64_t)v0;

}

@end
