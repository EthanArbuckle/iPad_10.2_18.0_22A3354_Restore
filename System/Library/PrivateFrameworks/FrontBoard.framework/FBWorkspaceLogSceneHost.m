@implementation FBWorkspaceLogSceneHost

void __FBWorkspaceLogSceneHost_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FrontBoard.workspace", "SceneHost");
  v1 = (void *)FBWorkspaceLogSceneHost___logObj;
  FBWorkspaceLogSceneHost___logObj = (uint64_t)v0;

}

@end
