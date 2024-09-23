@implementation MGLogForCategory

void __MGLogForCategory_block_invoke()
{
  uint64_t i;
  os_log_t v1;
  void *v2;

  for (i = 0; i != 4; ++i)
  {
    v1 = os_log_create("com.apple.MediaGroups", MGLogForCategory_categories[i]);
    v2 = (void *)MGLogForCategory_oslog[i];
    MGLogForCategory_oslog[i] = (uint64_t)v1;

  }
}

@end
