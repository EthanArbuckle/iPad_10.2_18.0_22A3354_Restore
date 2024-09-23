@implementation QLTInitLogging

void __QLTInitLogging_block_invoke()
{
  uint64_t i;
  os_log_t v1;
  void *v2;

  for (i = 0; i != 23; ++i)
  {
    v1 = os_log_create("com.apple.quicklook", _block_invoke_categories[i]);
    v2 = (void *)qltLogHandles[i];
    qltLogHandles[i] = (uint64_t)v1;

  }
}

@end
