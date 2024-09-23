@implementation FBWorkspaceLogCommon

void __FBWorkspaceLogCommon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FrontBoard.workspace", "Common");
  v1 = (void *)FBWorkspaceLogCommon___logObj;
  FBWorkspaceLogCommon___logObj = (uint64_t)v0;

}

@end
