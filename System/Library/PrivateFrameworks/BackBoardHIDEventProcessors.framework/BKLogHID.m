@implementation BKLogHID

void __BKLogHID_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x24BE0B4E0], "HID");
  v1 = (void *)BKLogHID___logObj;
  BKLogHID___logObj = (uint64_t)v0;

}

@end
