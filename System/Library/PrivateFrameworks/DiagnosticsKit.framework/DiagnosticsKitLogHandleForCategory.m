@implementation DiagnosticsKitLogHandleForCategory

void __DiagnosticsKitLogHandleForCategory_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;
  os_log_t v8;
  void *v9;
  os_log_t v10;
  void *v11;

  v0 = os_log_create("com.apple.DiagnosticsKit", "unspecified");
  v1 = (void *)DiagnosticsKitLogHandleForCategory_logHandles;
  DiagnosticsKitLogHandleForCategory_logHandles = (uint64_t)v0;

  v2 = os_log_create("com.apple.DiagnosticsKit", "host");
  v3 = (void *)qword_255DC5C68;
  qword_255DC5C68 = (uint64_t)v2;

  v4 = os_log_create("com.apple.DiagnosticsKit", "diagnostic");
  v5 = (void *)qword_255DC5C70;
  qword_255DC5C70 = (uint64_t)v4;

  v6 = os_log_create("com.apple.DiagnosticsKit", "component");
  v7 = (void *)qword_255DC5C78;
  qword_255DC5C78 = (uint64_t)v6;

  v8 = os_log_create("com.apple.DiagnosticsKit", "xpc");
  v9 = (void *)qword_255DC5C80;
  qword_255DC5C80 = (uint64_t)v8;

  v10 = os_log_create("com.apple.DiagnosticsKit", "unit-test");
  v11 = (void *)qword_255DC5C88;
  qword_255DC5C88 = (uint64_t)v10;

}

@end
