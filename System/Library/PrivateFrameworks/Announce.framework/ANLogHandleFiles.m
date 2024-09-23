@implementation ANLogHandleFiles

void __ANLogHandleFiles_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.intercom", "Files");
  v1 = (void *)ANLogHandleFiles_logger;
  ANLogHandleFiles_logger = (uint64_t)v0;

}

@end
