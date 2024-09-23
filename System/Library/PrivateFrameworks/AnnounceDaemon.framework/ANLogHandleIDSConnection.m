@implementation ANLogHandleIDSConnection

void __ANLogHandleIDSConnection_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.intercom", "IDSConnection");
  v1 = (void *)ANLogHandleIDSConnection_logger;
  ANLogHandleIDSConnection_logger = (uint64_t)v0;

}

@end
