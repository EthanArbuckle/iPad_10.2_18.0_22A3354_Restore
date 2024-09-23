@implementation FBSLogApplicationLibraryObserver

void __FBSLogApplicationLibraryObserver_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.frontboard.ApplicationLibrary", "observer");
  v1 = (void *)FBSLogApplicationLibraryObserver___logObj;
  FBSLogApplicationLibraryObserver___logObj = (uint64_t)v0;

}

@end
