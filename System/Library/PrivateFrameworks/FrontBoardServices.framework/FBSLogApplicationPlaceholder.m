@implementation FBSLogApplicationPlaceholder

void __FBSLogApplicationPlaceholder_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.frontboard.ApplicationLibrary", "placeholder");
  v1 = (void *)FBSLogApplicationPlaceholder___logObj;
  FBSLogApplicationPlaceholder___logObj = (uint64_t)v0;

}

@end
