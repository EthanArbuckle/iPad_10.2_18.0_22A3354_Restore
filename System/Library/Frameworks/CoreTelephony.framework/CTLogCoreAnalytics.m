@implementation CTLogCoreAnalytics

os_log_t __CTLogCoreAnalytics_block_invoke()
{
  os_log_t result;

  result = os_log_create(kCTLoggingSubsystem, "CoreAnalytics");
  CTLogCoreAnalytics_logger = (uint64_t)result;
  return result;
}

@end
