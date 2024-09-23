@implementation COLogForCategory

void __COLogForCategory_block_invoke()
{
  uint64_t i;
  os_log_t v1;
  void *v2;

  for (i = 0; i != 10; ++i)
  {
    v1 = os_log_create("com.apple.Coordination", COLogForCategory_categories[i]);
    v2 = (void *)COLogForCategory_oslog[i];
    COLogForCategory_oslog[i] = (uint64_t)v1;

  }
}

@end
