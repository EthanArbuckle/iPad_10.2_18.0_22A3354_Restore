@implementation MFMessageLoadingSignpostLog

void __MFMessageLoadingSignpostLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email.signposts", "MFMessageLoading");
  v1 = (void *)MFMessageLoadingSignpostLog_mf_once_object_7;
  MFMessageLoadingSignpostLog_mf_once_object_7 = (uint64_t)v0;

}

@end
