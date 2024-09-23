@implementation AABCFactoryFunction

os_log_t __AABCFactoryFunction_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.CoreBrightness.AABC", "default");
  _logHandle = (uint64_t)result;
  return result;
}

@end
