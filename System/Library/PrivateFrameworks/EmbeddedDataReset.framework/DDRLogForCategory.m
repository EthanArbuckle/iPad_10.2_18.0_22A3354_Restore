@implementation DDRLogForCategory

void __DDRLogForCategory_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;

  v0 = os_log_create("com.apple.devicedatareset.xpcserviceworker", "DeviceDataResetDefault");
  v1 = (void *)DDRLogForCategory_logObjects;
  DDRLogForCategory_logObjects = (uint64_t)v0;

  v2 = os_log_create("com.apple.devicedatareset.xpcserviceworker", "DeviceDataResetProgress");
  v3 = (void *)qword_253E78B88;
  qword_253E78B88 = (uint64_t)v2;

  v4 = os_log_create("com.apple.devicedatareset.daemon", "DeviceDataResetDaemon");
  v5 = (void *)qword_253E78B90;
  qword_253E78B90 = (uint64_t)v4;

  v6 = os_log_create("com.apple.devicedatareset.framework", "DeviceDataResetFramework");
  v7 = (void *)qword_253E78B98;
  qword_253E78B98 = (uint64_t)v6;

}

@end
