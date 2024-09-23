@implementation MTLogForCategory

void __MTLogForCategory_block_invoke()
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

  v0 = os_log_create("com.apple.mobiletimer.logging", "MobileTimer");
  v1 = (void *)MTLogForCategory_logObjects[0];
  MTLogForCategory_logObjects[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.mobiletimer.logging", "Agent");
  v3 = (void *)qword_1ECFC36C0;
  qword_1ECFC36C0 = (uint64_t)v2;

  v4 = os_log_create("com.apple.mobiletimer.logging", "XPC");
  v5 = (void *)qword_1ECFC36C8;
  qword_1ECFC36C8 = (uint64_t)v4;

  v6 = os_log_create("com.apple.mobiletimer.logging", "Alarms");
  v7 = (void *)qword_1ECFC36D0;
  qword_1ECFC36D0 = (uint64_t)v6;

  v8 = os_log_create("com.apple.mobiletimer.logging", "Timers");
  v9 = (void *)qword_1ECFC36D8;
  qword_1ECFC36D8 = (uint64_t)v8;

  v10 = os_log_create("com.apple.mobiletimer.logging", "Stopwatches");
  v11 = (void *)qword_1ECFC36E0;
  qword_1ECFC36E0 = (uint64_t)v10;

  v12 = os_log_create("com.apple.mobiletimer.logging", "Sync");
  v13 = (void *)qword_1ECFC36E8;
  qword_1ECFC36E8 = (uint64_t)v12;

  v14 = os_log_create("com.apple.mobiletimer.logging", "Sleep");
  v15 = (void *)qword_1ECFC36F0;
  qword_1ECFC36F0 = (uint64_t)v14;

  v16 = os_log_create("com.apple.mobiletimer.logging", "App");
  v17 = (void *)qword_1ECFC36F8;
  qword_1ECFC36F8 = (uint64_t)v16;

  v18 = os_log_create("com.apple.mobiletimer.logging", "Activity");
  v19 = (void *)qword_1ECFC3700;
  qword_1ECFC3700 = (uint64_t)v18;

}

@end
