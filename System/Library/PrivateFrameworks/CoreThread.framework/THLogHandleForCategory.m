@implementation THLogHandleForCategory

void __THLogHandleForCategory_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;

  v0 = os_log_create("com.apple.thread", "unspecified");
  v1 = (void *)THLogHandleForCategory_logHandles[0];
  THLogHandleForCategory_logHandles[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.thread", "credentials");
  v3 = (void *)qword_254DE1A88;
  qword_254DE1A88 = (uint64_t)v2;

}

@end
