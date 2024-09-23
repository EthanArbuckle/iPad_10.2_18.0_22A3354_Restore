@implementation BKLogOrientationClient

void __BKLogOrientationClient_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BackBoard", "OrientationClient");
  v1 = (void *)BKLogOrientationClient___logObj;
  BKLogOrientationClient___logObj = (uint64_t)v0;

}

@end
