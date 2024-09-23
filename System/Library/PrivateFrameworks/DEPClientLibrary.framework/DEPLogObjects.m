@implementation DEPLogObjects

void __DEPLogObjects_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;

  v0 = os_log_create("com.apple.devicemanagementclient", "DEPClient");
  v1 = (void *)DEPLogObjects__DEPLogObjects;
  DEPLogObjects__DEPLogObjects = (uint64_t)v0;

  v2 = os_log_create("com.apple.devicemanagementclient", "DEPDaemon");
  v3 = (void *)qword_1EFEFE1F0;
  qword_1EFEFE1F0 = (uint64_t)v2;

}

@end
