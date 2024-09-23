@implementation FBWorkspaceLogSnapshot

void __FBWorkspaceLogSnapshot_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FrontBoard.workspace", "Snapshot");
  v1 = (void *)FBWorkspaceLogSnapshot___logObj;
  FBWorkspaceLogSnapshot___logObj = (uint64_t)v0;

}

@end
