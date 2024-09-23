@implementation AXLogDataMigrator

void __AXLogDataMigrator_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXDataMigrator");
  v1 = (void *)AXLogDataMigrator___logObj;
  AXLogDataMigrator___logObj = (uint64_t)v0;

}

@end
