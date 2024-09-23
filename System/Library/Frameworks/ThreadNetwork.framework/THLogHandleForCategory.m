@implementation THLogHandleForCategory

os_log_t __THLogHandleForCategory_block_invoke()
{
  os_log_t result;

  THLogHandleForCategory_logHandles[0] = (uint64_t)os_log_create("com.apple.thread", "unspecified");
  result = os_log_create("com.apple.thread", "credentials");
  qword_1EFA2C978 = (uint64_t)result;
  return result;
}

@end
