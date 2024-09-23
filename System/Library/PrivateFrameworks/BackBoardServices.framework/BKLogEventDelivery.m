@implementation BKLogEventDelivery

void __BKLogEventDelivery_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BackBoard", "EventDelivery");
  v1 = (void *)BKLogEventDelivery___logObj;
  BKLogEventDelivery___logObj = (uint64_t)v0;

}

@end
