@implementation BKLogMousePointer

void __BKLogMousePointer_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BackBoard", "MousePointer");
  v1 = (void *)BKLogMousePointer___logObj;
  BKLogMousePointer___logObj = (uint64_t)v0;

}

@end
