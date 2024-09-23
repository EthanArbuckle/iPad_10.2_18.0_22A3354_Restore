@implementation AXSSLogForCategory

void __AXSSLogForCategory_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;

  v0 = os_log_create("com.apple.Accessibility", "default");
  v1 = (void *)AXSSLogForCategory_AllLogObjects[0];
  AXSSLogForCategory_AllLogObjects[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.Accessibility", "idc");
  v3 = (void *)qword_1EEE45DA8;
  qword_1EEE45DA8 = (uint64_t)v2;

  v4 = os_log_create("com.apple.Accessibility", "motiontracking");
  v5 = (void *)qword_1EEE45DB0;
  qword_1EEE45DB0 = (uint64_t)v4;

}

@end
