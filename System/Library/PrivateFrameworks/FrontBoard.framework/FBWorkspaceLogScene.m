@implementation FBWorkspaceLogScene

void __FBWorkspaceLogScene_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FrontBoard.workspace", "Scene");
  v1 = (void *)FBWorkspaceLogScene___logObj;
  FBWorkspaceLogScene___logObj = (uint64_t)v0;

}

@end
