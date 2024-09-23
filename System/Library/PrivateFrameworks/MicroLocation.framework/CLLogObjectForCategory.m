@implementation CLLogObjectForCategory

void ___CLLogObjectForCategory_MicroLocation_Default_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MicroLocation", "MicroLocation");
  v1 = (void *)logObject_MicroLocation_Default;
  logObject_MicroLocation_Default = (uint64_t)v0;

}

@end
