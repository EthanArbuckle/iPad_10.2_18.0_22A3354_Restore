@implementation CTLogConnectionPair

os_log_t __CTLogConnectionPair_block_invoke()
{
  os_log_t result;

  result = os_log_create(kCTLoggingSubsystem, "ConnectionPair");
  CTLogConnectionPair_logger = (uint64_t)result;
  return result;
}

@end
