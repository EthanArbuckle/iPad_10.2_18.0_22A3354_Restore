@implementation BKLogKeyboard

void __BKLogKeyboard_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BackBoard", "Keyboard");
  v1 = (void *)BKLogKeyboard___logObj;
  BKLogKeyboard___logObj = (uint64_t)v0;

}

@end
