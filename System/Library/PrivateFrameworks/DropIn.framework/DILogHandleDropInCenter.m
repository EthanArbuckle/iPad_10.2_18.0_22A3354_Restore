@implementation DILogHandleDropInCenter

void __DILogHandleDropInCenter_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.dropin", "DropInCenter");
  v1 = (void *)DILogHandleDropInCenter_logger;
  DILogHandleDropInCenter_logger = (uint64_t)v0;

}

@end
