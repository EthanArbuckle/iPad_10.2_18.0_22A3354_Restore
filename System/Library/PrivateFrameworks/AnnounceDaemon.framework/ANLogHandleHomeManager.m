@implementation ANLogHandleHomeManager

void __ANLogHandleHomeManager_HomeContext_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.intercom", "HomeManager_HomeContext");
  v1 = (void *)ANLogHandleHomeManager_HomeContext_logger;
  ANLogHandleHomeManager_HomeContext_logger = (uint64_t)v0;

}

void __ANLogHandleHomeManager_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.intercom", "HomeManager");
  v1 = (void *)ANLogHandleHomeManager_logger;
  ANLogHandleHomeManager_logger = (uint64_t)v0;

}

@end
