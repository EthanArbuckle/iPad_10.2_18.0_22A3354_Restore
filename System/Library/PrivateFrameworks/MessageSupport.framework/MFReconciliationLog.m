@implementation MFReconciliationLog

void __MFReconciliationLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "Reconciliation");
  v1 = (void *)MFReconciliationLog_mf_once_object_8;
  MFReconciliationLog_mf_once_object_8 = (uint64_t)v0;

}

@end
