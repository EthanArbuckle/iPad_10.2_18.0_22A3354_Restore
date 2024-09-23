@implementation UpdateLog

void __UpdateLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.DataDeliveryServices", "Update");
  v1 = (void *)UpdateLog_logFacility;
  UpdateLog_logFacility = (uint64_t)v0;

}

@end
