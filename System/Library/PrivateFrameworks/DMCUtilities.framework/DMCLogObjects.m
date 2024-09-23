@implementation DMCLogObjects

void __DMCLogObjects_block_invoke()
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

  v0 = os_log_create("com.apple.devicemanagementclient", "DMC");
  v1 = (void *)DMCLogObjects__DMCLogObjects;
  DMCLogObjects__DMCLogObjects = (uint64_t)v0;

  v2 = os_log_create("com.apple.devicemanagementclient", "MDM");
  v3 = (void *)qword_1ECD3F4D0;
  qword_1ECD3F4D0 = (uint64_t)v2;

  v4 = os_log_create("com.apple.devicemanagementclient", "Assertion");
  v5 = (void *)qword_1ECD3F4D8;
  qword_1ECD3F4D8 = (uint64_t)v4;

  v6 = os_log_create("com.apple.devicemanagementclient", "File");
  v7 = (void *)qword_1ECD3F4E0;
  qword_1ECD3F4E0 = (uint64_t)v6;

  v8 = os_log_create("com.apple.devicemanagementclient", "Restore");
  v9 = (void *)qword_1ECD3F4E8;
  qword_1ECD3F4E8 = (uint64_t)v8;

  v10 = os_log_create("com.apple.devicemanagementclient", "Tether");
  v11 = (void *)qword_1ECD3F4F0;
  qword_1ECD3F4F0 = (uint64_t)v10;

}

@end
