@implementation FBLogAppDataStore

void __FBLogAppDataStore_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FrontBoard", "AppDataStore");
  v1 = (void *)FBLogAppDataStore___logObj;
  FBLogAppDataStore___logObj = (uint64_t)v0;

}

@end
