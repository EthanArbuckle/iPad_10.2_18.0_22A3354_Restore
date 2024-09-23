@implementation GetFoundationFrameworkInfo

void ___GetFoundationFrameworkInfo_block_invoke()
{
  const __CFURL *v0;
  const __CFURL *v1;
  __CFBundle *v2;

  _GetFoundationFrameworkInfo__InfoPtr = (uint64_t)malloc_type_calloc(1uLL, 8uLL, 0x80040B8603338uLL);
  v0 = CFURLCreateWithFileSystemPath(0, CFSTR("/System/Library/Frameworks/Foundation.framework"), kCFURLPOSIXPathStyle, 1u);
  if (v0)
  {
    v1 = v0;
    v2 = CFBundleCreate(0, v0);
    CFRelease(v1);
    if (v2)
    {
      if (!CFBundleIsExecutableLoaded(v2))
        CFBundleLoadExecutable(v2);
      if (CFBundleIsExecutableLoaded(v2))
        *(_QWORD *)_GetFoundationFrameworkInfo__InfoPtr = objc_getClass("NSAutoreleasePool");
    }
  }
  if (!*(_QWORD *)_GetFoundationFrameworkInfo__InfoPtr)
  {
    free((void *)_GetFoundationFrameworkInfo__InfoPtr);
    _GetFoundationFrameworkInfo__InfoPtr = 0;
  }
}

@end
