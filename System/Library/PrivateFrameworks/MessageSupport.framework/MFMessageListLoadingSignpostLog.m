@implementation MFMessageListLoadingSignpostLog

void __MFMessageListLoadingSignpostLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email.signposts", "MFMessageListLoading");
  v1 = (void *)MFMessageListLoadingSignpostLog_mf_once_object_10;
  MFMessageListLoadingSignpostLog_mf_once_object_10 = (uint64_t)v0;

}

@end
