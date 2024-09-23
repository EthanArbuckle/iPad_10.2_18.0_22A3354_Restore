@implementation DefaultLog

void __DefaultLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.DataDeliveryServices", "Default");
  v1 = (void *)DefaultLog_logFacility;
  DefaultLog_logFacility = (uint64_t)v0;

}

@end
