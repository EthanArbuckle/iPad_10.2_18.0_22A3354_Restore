@implementation MFAccountsLog

void __MFAccountsLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "Accounts");
  v1 = (void *)MFAccountsLog_mf_once_object_5;
  MFAccountsLog_mf_once_object_5 = (uint64_t)v0;

}

@end
