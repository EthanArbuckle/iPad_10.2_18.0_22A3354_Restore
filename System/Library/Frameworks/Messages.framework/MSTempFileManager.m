@implementation MSTempFileManager

void __36___MSTempFileManager_sharedInstance__block_invoke()
{
  _MSTempFileManager *v0;
  void *v1;

  v0 = objc_alloc_init(_MSTempFileManager);
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;

}

@end
