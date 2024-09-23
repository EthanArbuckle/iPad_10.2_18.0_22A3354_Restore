@implementation ELSLogHandleForCategory

void __ELSLogHandleForCategory_block_invoke()
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

  v0 = os_log_create("com.apple.EnhancedLoggingState", "unspecified");
  v1 = (void *)ELSLogHandleForCategory_logHandles[0];
  ELSLogHandleForCategory_logHandles[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.EnhancedLoggingState", "host");
  v3 = (void *)qword_254D68AF0;
  qword_254D68AF0 = (uint64_t)v2;

  v4 = os_log_create("com.apple.EnhancedLoggingState", "networking");
  v5 = (void *)qword_254D68AF8;
  qword_254D68AF8 = (uint64_t)v4;

  v6 = os_log_create("com.apple.EnhancedLoggingState", "diagnostic");
  v7 = (void *)qword_254D68B00;
  qword_254D68B00 = (uint64_t)v6;

  v8 = os_log_create("com.apple.EnhancedLoggingState", "localization");
  v9 = (void *)qword_254D68B08;
  qword_254D68B08 = (uint64_t)v8;

  v10 = os_log_create("com.apple.EnhancedLoggingState", "ui");
  v11 = (void *)qword_254D68B10;
  qword_254D68B10 = (uint64_t)v10;

  v12 = os_log_create("com.apple.EnhancedLoggingState", "component");
  v13 = (void *)qword_254D68B18;
  qword_254D68B18 = (uint64_t)v12;

  v14 = os_log_create("com.apple.EnhancedLoggingState", "ids");
  v15 = (void *)qword_254D68B20;
  qword_254D68B20 = (uint64_t)v14;

  v16 = os_log_create("com.apple.EnhancedLoggingState", "xpc");
  v17 = (void *)qword_254D68B28;
  qword_254D68B28 = (uint64_t)v16;

  v18 = os_log_create("com.apple.EnhancedLoggingState", "unit-test");
  v19 = (void *)qword_254D68B30;
  qword_254D68B30 = (uint64_t)v18;

  v20 = os_log_create("com.apple.EnhancedLoggingState", "device-management");
  v21 = (void *)qword_254D68B38;
  qword_254D68B38 = (uint64_t)v20;

  v22 = os_log_create("com.apple.EnhancedLoggingState", "enhanced-logging-state");
  v23 = (void *)qword_254D68B40;
  qword_254D68B40 = (uint64_t)v22;

}

@end
