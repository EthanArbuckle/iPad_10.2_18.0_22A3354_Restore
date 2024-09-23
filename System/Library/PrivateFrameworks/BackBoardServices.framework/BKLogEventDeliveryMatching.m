@implementation BKLogEventDeliveryMatching

void __BKLogEventDeliveryMatching_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BackBoard", "EventDeliveryMatching");
  v1 = (void *)BKLogEventDeliveryMatching___logObj;
  BKLogEventDeliveryMatching___logObj = (uint64_t)v0;

}

@end
