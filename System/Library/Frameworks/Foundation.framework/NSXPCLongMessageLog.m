@implementation NSXPCLongMessageLog

os_log_t ___NSXPCLongMessageLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.Foundation", "xpc.exceptions");
  qword_1ECD09FA8 = (uint64_t)result;
  return result;
}

@end
