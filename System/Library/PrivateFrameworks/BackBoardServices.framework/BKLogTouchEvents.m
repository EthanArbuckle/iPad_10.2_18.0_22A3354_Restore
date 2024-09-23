@implementation BKLogTouchEvents

void __BKLogTouchEvents_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BackBoard", "TouchEvents");
  v1 = (void *)BKLogTouchEvents___logObj;
  BKLogTouchEvents___logObj = (uint64_t)v0;

}

@end
