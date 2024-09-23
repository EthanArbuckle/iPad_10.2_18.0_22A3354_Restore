@implementation CFNLog

os_log_t __CFNLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.CFNetwork", "Default");
  CFNLog::logger = (uint64_t)result;
  return result;
}

@end
