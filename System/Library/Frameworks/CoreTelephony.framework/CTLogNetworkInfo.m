@implementation CTLogNetworkInfo

os_log_t __CTLogNetworkInfo_block_invoke()
{
  os_log_t result;

  result = os_log_create(kCTLoggingSubsystem, "NetworkInfo");
  CTLogNetworkInfo_logger = (uint64_t)result;
  return result;
}

@end
