@implementation CTLogStewieDataClient

os_log_t __CTLogStewieDataClient_block_invoke()
{
  os_log_t result;

  result = os_log_create(kCTLoggingSubsystem, "StewieDataClient");
  CTLogStewieDataClient_logger = (uint64_t)result;
  return result;
}

@end
