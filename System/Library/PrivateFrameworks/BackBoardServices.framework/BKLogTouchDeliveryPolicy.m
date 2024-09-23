@implementation BKLogTouchDeliveryPolicy

void __BKLogTouchDeliveryPolicy_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BackBoard", "TouchDeliveryPolicy");
  v1 = (void *)BKLogTouchDeliveryPolicy___logObj;
  BKLogTouchDeliveryPolicy___logObj = (uint64_t)v0;

}

@end
