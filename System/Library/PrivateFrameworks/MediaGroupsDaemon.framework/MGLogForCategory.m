@implementation MGLogForCategory

void __MGLogForCategory_block_invoke()
{
  uint64_t i;
  os_log_t v1;
  void *v2;

  for (i = 0; i != 7; ++i)
  {
    v1 = os_log_create("com.apple.MediaGroupsDaemon", MGLogForCategory_categories[i]);
    v2 = (void *)MGLogForCategory_oslog[i];
    MGLogForCategory_oslog[i] = (uint64_t)v1;

  }
}

@end
