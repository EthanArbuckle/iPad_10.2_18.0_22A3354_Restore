@implementation MigrationLogger

void __MigrationLogger_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.InternationalSupport", "InternationalSupportMigrator");
  v1 = (void *)MigrationLogger___migrationLogger;
  MigrationLogger___migrationLogger = (uint64_t)v0;

}

@end
