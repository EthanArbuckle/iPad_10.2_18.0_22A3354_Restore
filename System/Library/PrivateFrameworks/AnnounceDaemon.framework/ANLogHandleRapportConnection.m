@implementation ANLogHandleRapportConnection

void __ANLogHandleRapportConnection_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.intercom", "RapportConnection");
  v1 = (void *)ANLogHandleRapportConnection_logger;
  ANLogHandleRapportConnection_logger = (uint64_t)v0;

}

@end
