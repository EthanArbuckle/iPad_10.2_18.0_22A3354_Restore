@implementation MTLoggingFramework

os_log_t __MTLoggingFramework_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.Multitouch", "Framework");
  MTLoggingFramework___logObj = (uint64_t)result;
  return result;
}

@end
