@implementation MFPersistenceLog

void __MFPersistenceLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "Persistence");
  v1 = (void *)MFPersistenceLog_mf_once_object_4;
  MFPersistenceLog_mf_once_object_4 = (uint64_t)v0;

}

@end
