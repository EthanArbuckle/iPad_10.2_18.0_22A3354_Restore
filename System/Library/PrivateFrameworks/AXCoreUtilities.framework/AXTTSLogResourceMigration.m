@implementation AXTTSLogResourceMigration

void __AXTTSLogResourceMigration_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXTTSResourceMigration");
  v1 = (void *)AXTTSLogResourceMigration___logObj;
  AXTTSLogResourceMigration___logObj = (uint64_t)v0;

}

@end
