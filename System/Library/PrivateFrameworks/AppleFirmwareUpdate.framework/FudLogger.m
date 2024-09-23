@implementation FudLogger

os_log_t __FudLogger_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.mobileaccessoryupdater", "default");
  __osl = (uint64_t)result;
  return result;
}

@end
