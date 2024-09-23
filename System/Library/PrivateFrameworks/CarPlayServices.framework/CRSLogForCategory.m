@implementation CRSLogForCategory

void __CRSLogForCategory_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;

  v0 = os_log_create("com.apple.CarPlayServices", "CarPlayServices");
  v1 = (void *)CRSLogForCategory_logObjects;
  CRSLogForCategory_logObjects = (uint64_t)v0;

  v2 = os_log_create("com.apple.CarPlayServices", "IconLayout");
  v3 = (void *)qword_253E9AC90;
  qword_253E9AC90 = (uint64_t)v2;

  v4 = os_log_create("com.apple.CarPlayServices", "InCall");
  v5 = (void *)qword_253E9AC98;
  qword_253E9AC98 = (uint64_t)v4;

  v6 = os_log_create("com.apple.CarPlayServices", "Session");
  v7 = (void *)qword_253E9ACA0;
  qword_253E9ACA0 = (uint64_t)v6;

}

@end
