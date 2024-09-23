@implementation GetManagedConfigFrameworkInfo

void ___GetManagedConfigFrameworkInfo_block_invoke()
{
  const __CFURL *v0;
  const __CFURL *v1;
  __CFBundle *v2;
  _QWORD *DataPointerForName;

  _GetManagedConfigFrameworkInfo__InfoPtr = (uint64_t)malloc_type_calloc(1uLL, 0x18uLL, 0xE00409BBF8FE8uLL);
  v0 = CFURLCreateWithFileSystemPath(0, CFSTR("/System/Library/PrivateFrameworks/ManagedConfiguration.framework"), kCFURLPOSIXPathStyle, 1u);
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
      {
        *(_QWORD *)(_GetManagedConfigFrameworkInfo__InfoPtr + 8) = objc_getClass("MCProfileConnection");
        DataPointerForName = CFBundleGetDataPointerForName(v2, CFSTR("MCFeatureAssistantProfanityFilterForced"));
        if (DataPointerForName)
          *(_QWORD *)(_GetManagedConfigFrameworkInfo__InfoPtr + 16) = *DataPointerForName;
      }
    }
  }
  if (!*(_QWORD *)(_GetManagedConfigFrameworkInfo__InfoPtr + 8)
    || !*(_QWORD *)(_GetManagedConfigFrameworkInfo__InfoPtr + 16))
  {
    free((void *)_GetManagedConfigFrameworkInfo__InfoPtr);
    _GetManagedConfigFrameworkInfo__InfoPtr = 0;
  }
}

@end
