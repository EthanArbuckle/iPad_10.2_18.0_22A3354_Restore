@implementation DiagnosticLogHandleForCategory

void __DiagnosticLogHandleForCategory_block_invoke(id a1)
{
  os_log_t v1;
  void *v2;
  os_log_t v3;
  void *v4;
  os_log_t v5;
  void *v6;
  os_log_t v7;
  void *v8;
  os_log_t v9;
  void *v10;
  os_log_t v11;
  void *v12;
  os_log_t v13;
  void *v14;
  os_log_t v15;
  void *v16;
  os_log_t v17;
  void *v18;
  os_log_t v19;
  void *v20;
  os_log_t v21;
  void *v22;
  os_log_t v23;
  void *v24;

  v1 = os_log_create("com.apple.Diagnostics", "unspecified");
  v2 = (void *)DiagnosticLogHandleForCategory_logHandles[0];
  DiagnosticLogHandleForCategory_logHandles[0] = (uint64_t)v1;

  v3 = os_log_create("com.apple.Diagnostics", "host");
  v4 = (void *)qword_24080;
  qword_24080 = (uint64_t)v3;

  v5 = os_log_create("com.apple.Diagnostics", "networking");
  v6 = (void *)qword_24088;
  qword_24088 = (uint64_t)v5;

  v7 = os_log_create("com.apple.Diagnostics", "diagnostic");
  v8 = (void *)qword_24090;
  qword_24090 = (uint64_t)v7;

  v9 = os_log_create("com.apple.Diagnostics", "localization");
  v10 = (void *)qword_24098;
  qword_24098 = (uint64_t)v9;

  v11 = os_log_create("com.apple.Diagnostics", "ui");
  v12 = (void *)qword_240A0;
  qword_240A0 = (uint64_t)v11;

  v13 = os_log_create("com.apple.Diagnostics", "component");
  v14 = (void *)qword_240A8;
  qword_240A8 = (uint64_t)v13;

  v15 = os_log_create("com.apple.Diagnostics", "ids");
  v16 = (void *)qword_240B0;
  qword_240B0 = (uint64_t)v15;

  v17 = os_log_create("com.apple.Diagnostics", "xpc");
  v18 = (void *)qword_240B8;
  qword_240B8 = (uint64_t)v17;

  v19 = os_log_create("com.apple.Diagnostics", "unit-test");
  v20 = (void *)qword_240C0;
  qword_240C0 = (uint64_t)v19;

  v21 = os_log_create("com.apple.Diagnostics", "device-management");
  v22 = (void *)qword_240C8;
  qword_240C8 = (uint64_t)v21;

  v23 = os_log_create("com.apple.Diagnostics", "enhanced-logging-state");
  v24 = (void *)qword_240D0;
  qword_240D0 = (uint64_t)v23;

}

@end
