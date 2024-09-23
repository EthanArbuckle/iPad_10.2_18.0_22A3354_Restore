@implementation LCFLoggingUtilsInit

void __LCFLoggingUtilsInit_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;

  v0 = os_log_create((const char *)LRRLoggingSubsystem, (const char *)LRRLoggingCategoryFeatureStore);
  v1 = (void *)LCFLogFeatureStore;
  LCFLogFeatureStore = (uint64_t)v0;

  v2 = os_log_create((const char *)LRRLoggingSubsystem, (const char *)LRRLoggingCategoryBiomeManager);
  v3 = (void *)LCFLogContextBiomeManager;
  LCFLogContextBiomeManager = (uint64_t)v2;

  v4 = os_log_create((const char *)LRRLoggingSubsystem, (const char *)LRRLoggingCategoryDatabaseConnection);
  v5 = (void *)LCFLogDatabaseConnection;
  LCFLogDatabaseConnection = (uint64_t)v4;

  v6 = os_log_create((const char *)LRRLoggingSubsystem, (const char *)LRRLoggingCategoryDatabaseColumnConnection);
  v7 = (void *)LCFLogDatabaseColumnConnection;
  LCFLogDatabaseColumnConnection = (uint64_t)v6;

}

@end
