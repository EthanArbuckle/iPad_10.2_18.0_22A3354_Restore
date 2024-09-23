@implementation ANLogHandleXPCTransactionManager

void __ANLogHandleXPCTransactionManager_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.intercom", "XPCTransactionManager");
  v1 = (void *)ANLogHandleXPCTransactionManager_logger;
  ANLogHandleXPCTransactionManager_logger = (uint64_t)v0;

}

@end
