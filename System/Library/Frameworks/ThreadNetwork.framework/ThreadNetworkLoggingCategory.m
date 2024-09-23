@implementation ThreadNetworkLoggingCategory

os_log_t __ThreadNetworkLoggingCategory_block_invoke()
{
  os_log_t result;

  ThreadNetworkLoggingCategory_logHandles = (uint64_t)os_log_create("com.apple.ThreadNetwork", "THClient");
  result = os_log_create("com.apple.ThreadNetwork", "THServer");
  qword_1EDBEE410 = (uint64_t)result;
  return result;
}

@end
