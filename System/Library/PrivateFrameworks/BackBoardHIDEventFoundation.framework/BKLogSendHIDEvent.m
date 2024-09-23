@implementation BKLogSendHIDEvent

void __BKLogSendHIDEvent_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D008E8], "SendHIDEvent");
  v1 = (void *)BKLogSendHIDEvent___logObj;
  BKLogSendHIDEvent___logObj = (uint64_t)v0;

}

@end
