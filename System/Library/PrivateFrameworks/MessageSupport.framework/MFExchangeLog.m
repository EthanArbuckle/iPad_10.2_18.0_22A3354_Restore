@implementation MFExchangeLog

void __MFExchangeLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "Exchange");
  v1 = (void *)MFExchangeLog_mf_once_object_6;
  MFExchangeLog_mf_once_object_6 = (uint64_t)v0;

}

@end
