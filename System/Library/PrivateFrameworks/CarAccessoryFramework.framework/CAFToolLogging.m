@implementation CAFToolLogging

void __CAFToolLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.caraccessoryframework", "CAFTool");
  v1 = (void *)CAFToolLogging_facility;
  CAFToolLogging_facility = (uint64_t)v0;

}

@end
