@implementation MFAutoFetchLog

void __MFAutoFetchLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "AutoFetch");
  v1 = (void *)MFAutoFetchLog_mf_once_object_3;
  MFAutoFetchLog_mf_once_object_3 = (uint64_t)v0;

}

@end
