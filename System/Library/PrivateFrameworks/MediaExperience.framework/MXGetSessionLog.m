@implementation MXGetSessionLog

os_log_t __MXGetSessionLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.mediaexperience", "Session");
  MXGetSessionLog__log = (uint64_t)result;
  return result;
}

@end
