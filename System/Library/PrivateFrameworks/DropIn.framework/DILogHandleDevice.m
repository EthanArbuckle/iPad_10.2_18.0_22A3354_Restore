@implementation DILogHandleDevice

void __DILogHandleDevice_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.dropin", "Device");
  v1 = (void *)DILogHandleDevice_logger;
  DILogHandleDevice_logger = (uint64_t)v0;

}

@end
