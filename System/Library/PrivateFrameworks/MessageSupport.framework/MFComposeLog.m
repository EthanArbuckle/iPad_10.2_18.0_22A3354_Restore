@implementation MFComposeLog

void __MFComposeLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "Compose");
  v1 = (void *)MFComposeLog_mf_once_object_7;
  MFComposeLog_mf_once_object_7 = (uint64_t)v0;

}

@end
