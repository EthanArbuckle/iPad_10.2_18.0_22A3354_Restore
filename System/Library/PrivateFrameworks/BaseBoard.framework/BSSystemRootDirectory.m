@implementation BSSystemRootDirectory

void __BSSystemRootDirectory_block_invoke()
{
  CFStringRef v0;
  void *v1;

  v0 = CFStringCreateWithFileSystemRepresentation(0, "/");
  v1 = (void *)_MergedGlobals_22;
  _MergedGlobals_22 = (uint64_t)v0;

}

@end
