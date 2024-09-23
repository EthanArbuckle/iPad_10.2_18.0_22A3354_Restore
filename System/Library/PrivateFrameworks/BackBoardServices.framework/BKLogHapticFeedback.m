@implementation BKLogHapticFeedback

void __BKLogHapticFeedback_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BackBoard", "HapticFeedback");
  v1 = (void *)BKLogHapticFeedback___logObj;
  BKLogHapticFeedback___logObj = (uint64_t)v0;

}

@end
