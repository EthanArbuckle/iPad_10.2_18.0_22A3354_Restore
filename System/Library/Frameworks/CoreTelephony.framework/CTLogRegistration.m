@implementation CTLogRegistration

os_log_t __CTLogRegistration_block_invoke()
{
  os_log_t result;

  result = os_log_create(kCTLoggingSubsystem, "Registration");
  CTLogRegistration_logger = (uint64_t)result;
  return result;
}

@end
