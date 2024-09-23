@implementation BKLogKeyPresses

void __BKLogKeyPresses_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D008E8], "KeyPresses");
  v1 = (void *)BKLogKeyPresses___logObj;
  BKLogKeyPresses___logObj = (uint64_t)v0;

}

@end
