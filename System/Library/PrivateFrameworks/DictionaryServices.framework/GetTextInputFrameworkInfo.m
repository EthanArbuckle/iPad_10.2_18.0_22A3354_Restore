@implementation GetTextInputFrameworkInfo

void ___GetTextInputFrameworkInfo_block_invoke()
{
  const __CFURL *v0;
  const __CFURL *v1;
  __CFBundle *v2;

  _GetTextInputFrameworkInfo__InfoPtr = (uint64_t)malloc_type_calloc(1uLL, 8uLL, 0x80040B8603338uLL);
  v0 = CFURLCreateWithFileSystemPath(0, CFSTR("/System/Library/PrivateFrameworks/TextInput.framework"), kCFURLPOSIXPathStyle, 1u);
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
        *(_QWORD *)_GetTextInputFrameworkInfo__InfoPtr = objc_getClass("TILinguisticAssetDownloadClient");
    }
  }
  if (!*(_QWORD *)_GetTextInputFrameworkInfo__InfoPtr)
  {
    free((void *)_GetTextInputFrameworkInfo__InfoPtr);
    _GetTextInputFrameworkInfo__InfoPtr = 0;
  }
}

@end
