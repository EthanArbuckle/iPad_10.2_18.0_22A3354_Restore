@implementation ASULogHandleForCategory

void __ASULogHandleForCategory_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;

  v0 = os_log_create("com.apple.appstoreutilities", "Defaults");
  v1 = (void *)ASULogHandleForCategory_logHandles[0];
  ASULogHandleForCategory_logHandles[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.appstoreutilities", "SQL");
  v3 = (void *)qword_2563DD7C8;
  qword_2563DD7C8 = (uint64_t)v2;

}

@end
