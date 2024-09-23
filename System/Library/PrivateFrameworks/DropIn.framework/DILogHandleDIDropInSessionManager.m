@implementation DILogHandleDIDropInSessionManager

void __DILogHandleDIDropInSessionManager_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.dropin", "DIDropInSessionManager");
  v1 = (void *)DILogHandleDIDropInSessionManager_logger;
  DILogHandleDIDropInSessionManager_logger = (uint64_t)v0;

}

@end
