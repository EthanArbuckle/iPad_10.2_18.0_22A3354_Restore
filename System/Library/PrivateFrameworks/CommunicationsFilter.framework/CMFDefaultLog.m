@implementation CMFDefaultLog

os_log_t __CMFDefaultLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.calls.communicationsfilter", "Default");
  CMFDefaultLog_CMFDefaultLog = (uint64_t)result;
  return result;
}

@end
