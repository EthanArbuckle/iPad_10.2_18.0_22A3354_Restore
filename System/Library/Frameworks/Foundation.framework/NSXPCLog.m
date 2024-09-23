@implementation NSXPCLog

os_log_t ___NSXPCLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.Foundation", "xpc");
  qword_1ECD09F88 = (uint64_t)result;
  return result;
}

@end
