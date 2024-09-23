@implementation NSKVODebuggingLog

os_log_t ___NSKVODebuggingLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.Foundation", "KVODebugging");
  qword_1ECD0A2D8 = (uint64_t)result;
  return result;
}

@end
