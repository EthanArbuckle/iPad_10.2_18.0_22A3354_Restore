@implementation LSPluginFaultLog

void ___LSPluginFaultLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.launchservices", "pluginfault");
  v1 = (void *)_LSPluginFaultLog_result;
  _LSPluginFaultLog_result = (uint64_t)v0;

}

@end
