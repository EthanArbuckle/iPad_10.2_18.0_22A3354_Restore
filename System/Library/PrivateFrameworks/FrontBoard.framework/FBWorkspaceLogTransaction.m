@implementation FBWorkspaceLogTransaction

void __FBWorkspaceLogTransaction_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FrontBoard.workspace", "Transaction");
  v1 = (void *)FBWorkspaceLogTransaction___logObj;
  FBWorkspaceLogTransaction___logObj = (uint64_t)v0;

}

@end
