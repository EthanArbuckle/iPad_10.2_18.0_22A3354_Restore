@implementation LCFModelStoreLoggingUtilsInit

void __LCFModelStoreLoggingUtilsInit_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;

  v0 = os_log_create((const char *)LRRLoggingSubsystem, (const char *)LRRLoggingCategoryModelStore);
  v1 = (void *)LCFLogModelStore;
  LCFLogModelStore = (uint64_t)v0;

  v2 = os_log_create((const char *)LRRLoggingSubsystem, (const char *)LRRLoggingCategoryModelStoreModelMetadata);
  v3 = (void *)LCFLogModelStoreModelMetadata;
  LCFLogModelStoreModelMetadata = (uint64_t)v2;

}

@end
