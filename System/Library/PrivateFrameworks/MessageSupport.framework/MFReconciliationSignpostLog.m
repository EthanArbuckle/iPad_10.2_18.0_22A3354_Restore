@implementation MFReconciliationSignpostLog

void __MFReconciliationSignpostLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email.signposts", "MFReconciliation");
  v1 = (void *)MFReconciliationSignpostLog_mf_once_object_8;
  MFReconciliationSignpostLog_mf_once_object_8 = (uint64_t)v0;

}

@end
