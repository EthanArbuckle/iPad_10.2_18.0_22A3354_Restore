@implementation MFLogNetwork

void __MFLogNetwork_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.mobilemail"), "UTF8String"), "Network");
  v1 = (void *)MFLogNetwork_mf_once_object_1;
  MFLogNetwork_mf_once_object_1 = (uint64_t)v0;

}

@end
