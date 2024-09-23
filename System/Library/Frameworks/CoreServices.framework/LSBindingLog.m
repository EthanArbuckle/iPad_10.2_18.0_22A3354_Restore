@implementation LSBindingLog

void ___LSBindingLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.launchservices", "binding");
  v1 = (void *)_LSBindingLog_result;
  _LSBindingLog_result = (uint64_t)v0;

}

@end
