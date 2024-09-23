@implementation ASTLogHandleForCategory

void __ASTLogHandleForCategory_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;

  v0 = os_log_create("com.apple.AppleServiceToolkit", "unspecified");
  v1 = (void *)ASTLogHandleForCategory_logHandles[0];
  ASTLogHandleForCategory_logHandles[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.AppleServiceToolkit", "networking");
  v3 = (void *)qword_2540D7AA8;
  qword_2540D7AA8 = (uint64_t)v2;

  v4 = os_log_create("com.apple.AppleServiceToolkit", "headers");
  v5 = (void *)qword_2540D7AB0;
  qword_2540D7AB0 = (uint64_t)v4;

  v6 = os_log_create("com.apple.AppleServiceToolkit", "payload");
  v7 = (void *)qword_2540D7AB8;
  qword_2540D7AB8 = (uint64_t)v6;

}

@end
