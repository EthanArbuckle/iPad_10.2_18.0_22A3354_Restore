@implementation IQFLogCategoryDefault

void __IQFLogCategoryDefault_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.pommes", "InfoQueryPersonalizationFeatures");
  v1 = (void *)IQFLogCategoryDefault_defaultLog;
  IQFLogCategoryDefault_defaultLog = (uint64_t)v0;

}

@end
