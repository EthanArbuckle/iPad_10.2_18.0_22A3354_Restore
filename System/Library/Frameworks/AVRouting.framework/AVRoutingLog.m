@implementation AVRoutingLog

os_log_t ___AVRoutingLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.avrouting", "AVRouting");
  _log = (uint64_t)result;
  return result;
}

@end
