@implementation MILogHandleForSignpost

void __MILogHandleForSignpost_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.installd", "Signpost");
  v1 = (void *)MILogHandleForSignpost_logHandle;
  MILogHandleForSignpost_logHandle = (uint64_t)v0;

}

void __MILogHandleForSignpost_block_invoke_0()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.installd", "Signpost");
  v1 = (void *)MILogHandleForSignpost_logHandle_0;
  MILogHandleForSignpost_logHandle_0 = (uint64_t)v0;

}

@end
