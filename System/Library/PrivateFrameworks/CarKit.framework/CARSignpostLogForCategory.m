@implementation CARSignpostLogForCategory

void __CARSignpostLogForCategory_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;

  v0 = os_log_create("com.apple.carkit", "CarKit");
  v1 = (void *)CARSignpostLogForCategory_logObjects[0];
  CARSignpostLogForCategory_logObjects[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.caraccessoryframework", "CAFData");
  v3 = (void *)qword_1EE99DBF0;
  qword_1EE99DBF0 = (uint64_t)v2;

  v4 = os_log_create("com.apple.caraccessoryframework", "CAFCore");
  v5 = (void *)qword_1EE99DBF8;
  qword_1EE99DBF8 = (uint64_t)v4;

  v6 = os_log_create("com.apple.caraccessoryframework", "CAFAppLaunch");
  v7 = (void *)qword_1EE99DC00;
  qword_1EE99DC00 = (uint64_t)v6;

}

@end
