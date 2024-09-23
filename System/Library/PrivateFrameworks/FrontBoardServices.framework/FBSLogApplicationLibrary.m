@implementation FBSLogApplicationLibrary

void __FBSLogApplicationLibrary_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.frontboard.ApplicationLibrary", "default");
  v1 = (void *)FBSLogApplicationLibrary___logObj;
  FBSLogApplicationLibrary___logObj = (uint64_t)v0;

}

@end
