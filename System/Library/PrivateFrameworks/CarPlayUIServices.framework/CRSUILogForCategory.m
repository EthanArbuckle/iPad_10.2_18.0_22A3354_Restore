@implementation CRSUILogForCategory

void __CRSUILogForCategory_block_invoke()
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

  v0 = os_log_create("com.apple.CarPlayUIServices", "CarPlayUIServices");
  v1 = (void *)CRSUILogForCategory_logObjects[0];
  CRSUILogForCategory_logObjects[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.CarPlayUIServices", "StatusBar");
  v3 = (void *)qword_2549C36D8;
  qword_2549C36D8 = (uint64_t)v2;

  v4 = os_log_create("com.apple.CarPlayUIServices", "AudioNotification");
  v5 = (void *)qword_2549C36E0;
  qword_2549C36E0 = (uint64_t)v4;

  v6 = os_log_create("com.apple.CarPlayUIServices", "DashboardWindow");
  v7 = (void *)qword_2549C36E8;
  qword_2549C36E8 = (uint64_t)v6;

  v8 = os_log_create("com.apple.CarPlayUIServices", "Appearance");
  v9 = (void *)qword_2549C36F0;
  qword_2549C36F0 = (uint64_t)v8;

  v10 = os_log_create("com.apple.CarPlayUIServices", "PunchThrough");
  v11 = (void *)qword_2549C36F8;
  qword_2549C36F8 = (uint64_t)v10;

  v12 = os_log_create("com.apple.CarPlayUIServices", "ClusterTheme");
  v13 = (void *)qword_2549C3700;
  qword_2549C3700 = (uint64_t)v12;

}

@end
