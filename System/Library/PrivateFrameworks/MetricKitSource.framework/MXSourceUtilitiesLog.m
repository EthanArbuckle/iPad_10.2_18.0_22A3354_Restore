@implementation MXSourceUtilitiesLog

void ___MXSourceUtilitiesLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.metrickit.sourceutilities", ");
  v1 = (void *)_MXSourceUtilitiesLog_log;
  _MXSourceUtilitiesLog_log = (uint64_t)v0;

}

@end
