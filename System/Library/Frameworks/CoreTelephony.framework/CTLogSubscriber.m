@implementation CTLogSubscriber

os_log_t __CTLogSubscriber_block_invoke()
{
  os_log_t result;

  result = os_log_create(kCTLoggingSubsystem, "Subscriber");
  CTLogSubscriber_logger = (uint64_t)result;
  return result;
}

@end
