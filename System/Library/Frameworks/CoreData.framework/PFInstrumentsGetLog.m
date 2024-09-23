@implementation PFInstrumentsGetLog

os_log_t __PFInstrumentsGetLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.coredata", "instruments");
  PFInstrumentsGetLog_coreDataInstrumentsLog = (uint64_t)result;
  return result;
}

@end
