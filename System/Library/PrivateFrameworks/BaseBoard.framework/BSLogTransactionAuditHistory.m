@implementation BSLogTransactionAuditHistory

void __BSLogTransactionAuditHistory_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BaseBoard", "TransactionAuditHistory");
  v1 = (void *)_MergedGlobals_10;
  _MergedGlobals_10 = (uint64_t)v0;

}

@end
