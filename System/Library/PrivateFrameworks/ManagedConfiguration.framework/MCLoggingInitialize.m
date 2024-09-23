@implementation MCLoggingInitialize

void __MCLoggingInitialize_block_invoke()
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
  os_log_t v24;
  void *v25;

  v0 = os_log_create("com.apple.ManagedConfiguration", "MC");
  v1 = (void *)_MCLogObjects;
  _MCLogObjects = (uint64_t)v0;

  v2 = os_log_create("com.apple.ManagedConfiguration", "MDM");
  v3 = (void *)qword_1ECD40B00;
  qword_1ECD40B00 = (uint64_t)v2;

  v4 = os_log_create("com.apple.ManagedConfiguration", "profiled");
  v5 = (void *)qword_1ECD40B08;
  qword_1ECD40B08 = (uint64_t)v4;

  v6 = os_log_create("com.apple.ManagedConfiguration", "PIH");
  v7 = (void *)qword_1ECD40B10;
  qword_1ECD40B10 = (uint64_t)v6;

  v8 = os_log_create("com.apple.ManagedConfiguration", "OpenIn");
  v9 = (void *)qword_1ECD40B18;
  qword_1ECD40B18 = (uint64_t)v8;

  v10 = os_log_create("com.apple.ManagedConfiguration", "passcodenagd");
  v11 = (void *)qword_1ECD40B28;
  qword_1ECD40B28 = (uint64_t)v10;

  v12 = os_log_create("com.apple.ManagedConfiguration", "ProfileEvents");
  v13 = (void *)qword_1ECD40B20;
  qword_1ECD40B20 = (uint64_t)v12;

  v14 = os_log_create("com.apple.ManagedConfiguration", "Assertions");
  v15 = (void *)qword_1ECD40B30;
  qword_1ECD40B30 = (uint64_t)v14;

  v16 = os_log_create("com.apple.ManagedConfiguration", "ProfileConnection");
  v17 = (void *)qword_1ECD40B38;
  qword_1ECD40B38 = (uint64_t)v16;

  v18 = os_log_create("com.apple.ManagedConfiguration", "MCInstaller");
  v19 = (void *)qword_1ECD40B40;
  qword_1ECD40B40 = (uint64_t)v18;

  v20 = os_log_create("com.apple.ManagedConfiguration", "File");
  v21 = (void *)qword_1ECD40B48;
  qword_1ECD40B48 = (uint64_t)v20;

  v22 = os_log_create("com.apple.ManagedConfiguration", "UPPTrust");
  v23 = (void *)qword_1ECD40B50;
  qword_1ECD40B50 = (uint64_t)v22;

  v24 = os_log_create("com.apple.ManagedConfiguration", "Migration");
  v25 = (void *)qword_1ECD40B58;
  qword_1ECD40B58 = (uint64_t)v24;

}

@end
