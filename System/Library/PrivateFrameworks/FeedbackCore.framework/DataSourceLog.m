@implementation DataSourceLog

void __DataSourceLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FeedbackCore", "diffable");
  v1 = (void *)DataSourceLog_handle;
  DataSourceLog_handle = (uint64_t)v0;

}

@end
