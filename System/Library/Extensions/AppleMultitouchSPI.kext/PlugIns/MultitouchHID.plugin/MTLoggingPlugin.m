@implementation MTLoggingPlugin

os_log_t __MTLoggingPlugin_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.Multitouch", "Plugin");
  MTLoggingPlugin___logObj = (uint64_t)result;
  return result;
}

@end
