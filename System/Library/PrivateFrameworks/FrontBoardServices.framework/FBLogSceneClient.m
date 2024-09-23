@implementation FBLogSceneClient

void __FBLogSceneClient_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FrontBoard", "SceneClient");
  v1 = (void *)FBLogSceneClient___logObj;
  FBLogSceneClient___logObj = (uint64_t)v0;

}

@end
