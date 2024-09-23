@implementation BKLogDisplay

void __BKLogDisplay_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BackBoard", "Display");
  v1 = (void *)BKLogDisplay___logObj;
  BKLogDisplay___logObj = (uint64_t)v0;

}

@end
