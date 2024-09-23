@implementation BKLogTouchDeliveryObserver

void __BKLogTouchDeliveryObserver_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BackBoard", "TouchDeliveryObserver");
  v1 = (void *)BKLogTouchDeliveryObserver___logObj;
  BKLogTouchDeliveryObserver___logObj = (uint64_t)v0;

}

@end
