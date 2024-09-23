@implementation BKLogMotionEvents

void __BKLogMotionEvents_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x24BE0B4E0], "MotionEvents");
  v1 = (void *)BKLogMotionEvents___logObj;
  BKLogMotionEvents___logObj = (uint64_t)v0;

}

@end
