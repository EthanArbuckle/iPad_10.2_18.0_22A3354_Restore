@implementation CTLogClientCache

os_log_t __CTLogClientCache_block_invoke()
{
  os_log_t result;

  result = os_log_create(kCTLoggingSubsystem, "ClientCache");
  CTLogClientCache_logger = (uint64_t)result;
  return result;
}

@end
