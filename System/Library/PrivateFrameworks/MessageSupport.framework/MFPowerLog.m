@implementation MFPowerLog

void __MFPowerLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.mobilemail"), "UTF8String"), "Power");
  v1 = (void *)MFPowerLog_mf_once_object_2;
  MFPowerLog_mf_once_object_2 = (uint64_t)v0;

}

@end
