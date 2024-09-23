@implementation MFLogGeneral

void __MFLogGeneral_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.mobilemail"), "UTF8String"), "General");
  v1 = (void *)MFLogGeneral_mf_once_object_0;
  MFLogGeneral_mf_once_object_0 = (uint64_t)v0;

}

@end
