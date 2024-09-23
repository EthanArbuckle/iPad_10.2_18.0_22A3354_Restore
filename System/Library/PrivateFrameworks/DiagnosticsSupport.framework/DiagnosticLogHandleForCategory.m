@implementation DiagnosticLogHandleForCategory

void __DiagnosticLogHandleForCategory_block_invoke()
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
  os_log_t v12;
  void *v13;
  os_log_t v14;
  void *v15;
  os_log_t v16;
  void *v17;
  os_log_t v18;
  void *v19;
  os_log_t v20;
  void *v21;
  os_log_t v22;
  void *v23;

  v0 = os_log_create("com.apple.Diagnostics", "unspecified");
  v1 = (void *)DiagnosticLogHandleForCategory_logHandles;
  DiagnosticLogHandleForCategory_logHandles = (uint64_t)v0;

  v2 = os_log_create("com.apple.Diagnostics", "host");
  v3 = (void *)qword_2540F7950;
  qword_2540F7950 = (uint64_t)v2;

  v4 = os_log_create("com.apple.Diagnostics", "networking");
  v5 = (void *)qword_2540F7958;
  qword_2540F7958 = (uint64_t)v4;

  v6 = os_log_create("com.apple.Diagnostics", "diagnostic");
  v7 = (void *)qword_2540F7960;
  qword_2540F7960 = (uint64_t)v6;

  v8 = os_log_create("com.apple.Diagnostics", "localization");
  v9 = (void *)qword_2540F7968;
  qword_2540F7968 = (uint64_t)v8;

  v10 = os_log_create("com.apple.Diagnostics", "ui");
  v11 = (void *)qword_2540F7970;
  qword_2540F7970 = (uint64_t)v10;

  v12 = os_log_create("com.apple.Diagnostics", "component");
  v13 = (void *)qword_2540F7978;
  qword_2540F7978 = (uint64_t)v12;

  v14 = os_log_create("com.apple.Diagnostics", "ids");
  v15 = (void *)qword_2540F7980;
  qword_2540F7980 = (uint64_t)v14;

  v16 = os_log_create("com.apple.Diagnostics", "xpc");
  v17 = (void *)qword_2540F7988;
  qword_2540F7988 = (uint64_t)v16;

  v18 = os_log_create("com.apple.Diagnostics", "unit-test");
  v19 = (void *)qword_2540F7990;
  qword_2540F7990 = (uint64_t)v18;

  v20 = os_log_create("com.apple.Diagnostics", "device-management");
  v21 = (void *)qword_2540F7998;
  qword_2540F7998 = (uint64_t)v20;

  v22 = os_log_create("com.apple.Diagnostics", "enhanced-logging-state");
  v23 = (void *)qword_2540F79A0;
  qword_2540F79A0 = (uint64_t)v22;

}

@end
