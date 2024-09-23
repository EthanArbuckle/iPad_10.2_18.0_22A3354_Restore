@implementation DACLogForCategory

void __DACLogForCategory_block_invoke()
{
  uint64_t i;
  os_log_t v1;
  void *v2;

  for (i = 0; i != 6; ++i)
  {
    v1 = os_log_create("com.apple.DeviceActivityConductor", DACLogForCategory_categories[i]);
    v2 = (void *)DACLogForCategory_oslog[i];
    DACLogForCategory_oslog[i] = (uint64_t)v1;

  }
}

@end
