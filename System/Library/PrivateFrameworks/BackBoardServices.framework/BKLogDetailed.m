@implementation BKLogDetailed

void __BKLogDetailed_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BackBoard", "Detailed");
  v1 = (void *)BKLogDetailed___logObj;
  BKLogDetailed___logObj = (uint64_t)v0;

}

@end
