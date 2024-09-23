@implementation CTLogStewieMonitor

os_log_t __CTLogStewieMonitor_block_invoke()
{
  os_log_t result;

  result = os_log_create(kCTLoggingSubsystem, "StewieMonitor");
  CTLogStewieMonitor_logger = (uint64_t)result;
  return result;
}

@end
