@implementation ANLogHandleMessengerDestination

void __ANLogHandleMessengerDestination_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.intercom", "MessengerDestination");
  v1 = (void *)ANLogHandleMessengerDestination_logger;
  ANLogHandleMessengerDestination_logger = (uint64_t)v0;

}

@end
