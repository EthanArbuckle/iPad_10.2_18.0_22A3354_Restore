@implementation FBWorkspaceLogSceneLayout

void __FBWorkspaceLogSceneLayout_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FrontBoard.workspace", "SceneLayout");
  v1 = (void *)FBWorkspaceLogSceneLayout___logObj;
  FBWorkspaceLogSceneLayout___logObj = (uint64_t)v0;

}

@end
