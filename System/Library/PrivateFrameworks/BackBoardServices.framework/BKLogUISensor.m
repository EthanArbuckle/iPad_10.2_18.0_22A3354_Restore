@implementation BKLogUISensor

void __BKLogUISensor_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BackBoard", "UISensor");
  v1 = (void *)BKLogUISensor___logObj;
  BKLogUISensor___logObj = (uint64_t)v0;

}

@end
