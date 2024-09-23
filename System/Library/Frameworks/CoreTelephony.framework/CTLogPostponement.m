@implementation CTLogPostponement

os_log_t __CTLogPostponement_block_invoke()
{
  os_log_t result;

  result = os_log_create(kCTLoggingSubsystem, "Postponement");
  CTLogPostponement_logger = (uint64_t)result;
  return result;
}

@end
