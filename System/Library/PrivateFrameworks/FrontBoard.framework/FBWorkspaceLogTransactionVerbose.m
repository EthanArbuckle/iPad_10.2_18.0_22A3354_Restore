@implementation FBWorkspaceLogTransactionVerbose

void __FBWorkspaceLogTransactionVerbose_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FrontBoard.workspace", "TransactionVerbose");
  v1 = (void *)FBWorkspaceLogTransactionVerbose___logObj;
  FBWorkspaceLogTransactionVerbose___logObj = (uint64_t)v0;

}

@end
