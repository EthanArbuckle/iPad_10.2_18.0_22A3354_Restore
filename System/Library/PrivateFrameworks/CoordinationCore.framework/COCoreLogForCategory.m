@implementation COCoreLogForCategory

void __COCoreLogForCategory_block_invoke()
{
  uint64_t i;
  os_log_t v1;
  void *v2;

  for (i = 0; i != 22; ++i)
  {
    v1 = os_log_create("com.apple.CoordinationCore", COCoreLogForCategory_categories[i]);
    v2 = (void *)COCoreLogForCategory_oslog[i];
    COCoreLogForCategory_oslog[i] = (uint64_t)v1;

  }
}

@end
