@implementation CTLogClientXPC

os_log_t __CTLogClientXPC_block_invoke()
{
  os_log_t result;

  result = os_log_create(kCTLoggingSubsystem, "ClientXPC");
  CTLogClientXPC_logger = (uint64_t)result;
  return result;
}

@end
