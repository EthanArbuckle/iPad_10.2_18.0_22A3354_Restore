@implementation MFMessageComposeLoadingSignpostLog

void __MFMessageComposeLoadingSignpostLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email.signposts", "MFMessageComposeLoading");
  v1 = (void *)MFMessageComposeLoadingSignpostLog_mf_once_object_9;
  MFMessageComposeLoadingSignpostLog_mf_once_object_9 = (uint64_t)v0;

}

@end
