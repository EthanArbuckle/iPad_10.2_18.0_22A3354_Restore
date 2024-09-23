@implementation ANLogHandleCompanionConnection

void __ANLogHandleCompanionConnection_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.intercom", "CompanionConnection");
  v1 = (void *)ANLogHandleCompanionConnection_logger;
  ANLogHandleCompanionConnection_logger = (uint64_t)v0;

}

@end
