@implementation CTLogMessageCenter

os_log_t __CTLogMessageCenter_block_invoke()
{
  os_log_t result;

  result = os_log_create(kCTLoggingSubsystem, "MessageCenter");
  CTLogMessageCenter_logger = (uint64_t)result;
  return result;
}

@end
