@implementation EDLibraryLog

void __EDLibraryLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "Library");
  v1 = (void *)EDLibraryLog_log;
  EDLibraryLog_log = (uint64_t)v0;

}

@end
