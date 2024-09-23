@implementation BKLogButton

void __BKLogButton_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D008E8], "Button");
  v1 = (void *)BKLogButton___logObj;
  BKLogButton___logObj = (uint64_t)v0;

}

@end
