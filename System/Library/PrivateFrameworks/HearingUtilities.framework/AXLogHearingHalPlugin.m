@implementation AXLogHearingHalPlugin

void __AXLogHearingHalPlugin_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0CF32D8], "AXHearingHalPlugin");
  v1 = (void *)AXLogHearingHalPlugin___logObj;
  AXLogHearingHalPlugin___logObj = (uint64_t)v0;

}

@end
