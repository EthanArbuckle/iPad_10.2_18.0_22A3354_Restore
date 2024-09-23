@implementation CoreRELog

os_log_t __CoreRELog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.re", "API");
  CoreRELog::log = (uint64_t)result;
  return result;
}

@end
