@implementation ASFLogHandleForCategory

void __ASFLogHandleForCategory_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;

  v0 = os_log_create("com.apple.appstorefoundation", "Default");
  v1 = (void *)ASFLogHandleForCategory_logHandles_0;
  ASFLogHandleForCategory_logHandles_0 = (uint64_t)v0;

  v2 = os_log_create("com.apple.appstorefoundation", "Signpost");
  v3 = (void *)ASFLogHandleForCategory_logHandles_1;
  ASFLogHandleForCategory_logHandles_1 = (uint64_t)v2;

}

void __ASFLogHandleForCategory_block_invoke_0()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;

  v0 = os_log_create("com.apple.appstorefoundation", "Default");
  v1 = (void *)ASFLogHandleForCategory_logHandles_0_0;
  ASFLogHandleForCategory_logHandles_0_0 = (uint64_t)v0;

  v2 = os_log_create("com.apple.appstorefoundation", "Signpost");
  v3 = (void *)ASFLogHandleForCategory_logHandles_1_0;
  ASFLogHandleForCategory_logHandles_1_0 = (uint64_t)v2;

}

@end
