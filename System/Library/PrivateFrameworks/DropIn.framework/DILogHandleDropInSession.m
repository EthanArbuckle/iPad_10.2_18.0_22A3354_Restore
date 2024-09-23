@implementation DILogHandleDropInSession

void __DILogHandleDropInSession_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.dropin", "DropInSession");
  v1 = (void *)DILogHandleDropInSession_logger;
  DILogHandleDropInSession_logger = (uint64_t)v0;

}

@end
