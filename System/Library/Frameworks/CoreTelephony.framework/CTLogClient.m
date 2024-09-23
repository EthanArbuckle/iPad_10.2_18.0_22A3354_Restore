@implementation CTLogClient

os_log_t __CTLogClient_block_invoke()
{
  os_log_t result;

  result = os_log_create(kCTLoggingSubsystem, "Client");
  CTLogClient_logger = (uint64_t)result;
  return result;
}

@end
