@implementation MXGetAssertionLog

os_log_t __MXGetAssertionLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.mediaexperience", "Assertion");
  MXGetAssertionLog__log = (uint64_t)result;
  return result;
}

@end
