@implementation IPInitLogging

void __IPInitLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.DataDetectorsNaturalLanguage", "default");
  v1 = (void *)_IPLogHandle;
  _IPLogHandle = (uint64_t)v0;

}

@end
