@implementation GetMobileAssetObjectInfo

void ___GetMobileAssetObjectInfo_block_invoke()
{
  const __CFURL *v0;
  const __CFURL *v1;
  __CFBundle *FunctionPointerForName;
  const __CFURL *v3;
  const __CFURL *v4;
  __CFBundle *v5;
  _QWORD *DataPointerForName;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  const __CFURL *v11;
  const __CFURL *v12;
  __CFBundle *v13;
  int IsExecutableLoaded;
  uint64_t v15;
  _QWORD *v16;

  v0 = CFURLCreateWithFileSystemPath(0, CFSTR("/System/Library/Frameworks/Foundation.framework"), kCFURLPOSIXPathStyle, 1u);
  if (!v0)
    goto LABEL_8;
  v1 = v0;
  FunctionPointerForName = CFBundleCreate(0, v0);
  CFRelease(v1);
  if (!FunctionPointerForName)
    goto LABEL_9;
  if (!CFBundleIsExecutableLoaded(FunctionPointerForName))
    CFBundleLoadExecutable(FunctionPointerForName);
  if (!CFBundleIsExecutableLoaded(FunctionPointerForName))
  {
LABEL_8:
    FunctionPointerForName = 0;
    goto LABEL_9;
  }
  _GetMobileAssetObjectInfo__ObjectInfoPtr = (uint64_t)malloc_type_calloc(1uLL, 0x78uLL, 0xE0040AF3BDA01uLL);
  FunctionPointerForName = (__CFBundle *)CFBundleGetFunctionPointerForName(FunctionPointerForName, CFSTR("NSClassFromString"));
  if (FunctionPointerForName)
  {
    *(_QWORD *)_GetMobileAssetObjectInfo__ObjectInfoPtr = ((uint64_t (*)(const __CFString *))FunctionPointerForName)(CFSTR("NSAutoreleasePool"));
    *(_QWORD *)(_GetMobileAssetObjectInfo__ObjectInfoPtr + 8) = ((uint64_t (*)(const __CFString *))FunctionPointerForName)(CFSTR("NSFileManager"));
    *(_QWORD *)(_GetMobileAssetObjectInfo__ObjectInfoPtr + 56) = ((uint64_t (*)(const __CFString *))FunctionPointerForName)(CFSTR("NSProcessInfo"));
    *(_QWORD *)(_GetMobileAssetObjectInfo__ObjectInfoPtr + 64) = ((uint64_t (*)(const __CFString *))FunctionPointerForName)(CFSTR("NSLocale"));
  }
LABEL_9:
  v3 = CFURLCreateWithFileSystemPath(0, CFSTR("/System/Library/PrivateFrameworks/MobileAsset.framework"), kCFURLPOSIXPathStyle, 1u);
  if (v3)
  {
    v4 = v3;
    v5 = CFBundleCreate(0, v3);
    CFRelease(v4);
    if (v5)
    {
      if (!CFBundleIsExecutableLoaded(v5))
        CFBundleLoadExecutable(v5);
      if (_GetMobileAssetObjectInfo__ObjectInfoPtr && CFBundleIsExecutableLoaded(v5))
      {
        if (FunctionPointerForName)
        {
          *(_QWORD *)(_GetMobileAssetObjectInfo__ObjectInfoPtr + 16) = ((uint64_t (*)(const __CFString *))FunctionPointerForName)(CFSTR("ASAssetQuery"));
          *(_QWORD *)(_GetMobileAssetObjectInfo__ObjectInfoPtr + 24) = ((uint64_t (*)(const __CFString *))FunctionPointerForName)(CFSTR("ASAsset"));
          *(_QWORD *)(_GetMobileAssetObjectInfo__ObjectInfoPtr + 32) = ((uint64_t (*)(const __CFString *))FunctionPointerForName)(CFSTR("MAAssetQuery"));
          *(_QWORD *)(_GetMobileAssetObjectInfo__ObjectInfoPtr + 40) = ((uint64_t (*)(const __CFString *))FunctionPointerForName)(CFSTR("MAAsset"));
          *(_QWORD *)(_GetMobileAssetObjectInfo__ObjectInfoPtr + 48) = ((uint64_t (*)(const __CFString *))FunctionPointerForName)(CFSTR("MADownloadOptions"));
        }
        *(_QWORD *)(_GetMobileAssetObjectInfo__ObjectInfoPtr + 72) = CFBundleGetFunctionPointerForName(v5, CFSTR("ASServerURLForAssetType"));
        DataPointerForName = CFBundleGetDataPointerForName(v5, CFSTR("ASAttributeCompatibilityVersion"));
        if (DataPointerForName)
          *(_QWORD *)(_GetMobileAssetObjectInfo__ObjectInfoPtr + 80) = *DataPointerForName;
        v7 = CFBundleGetDataPointerForName(v5, CFSTR("ASAttributeContentVersion"));
        if (v7)
          *(_QWORD *)(_GetMobileAssetObjectInfo__ObjectInfoPtr + 88) = *v7;
        v8 = CFBundleGetDataPointerForName(v5, CFSTR("ASStateOperation"));
        if (v8)
          *(_QWORD *)(_GetMobileAssetObjectInfo__ObjectInfoPtr + 96) = *v8;
        v9 = CFBundleGetDataPointerForName(v5, CFSTR("ASOperationCompleted"));
        if (v9)
          *(_QWORD *)(_GetMobileAssetObjectInfo__ObjectInfoPtr + 104) = *v9;
        v10 = CFBundleGetDataPointerForName(v5, CFSTR("ASErrorDomain"));
        if (v10)
          *(_QWORD *)(_GetMobileAssetObjectInfo__ObjectInfoPtr + 112) = *v10;
      }
    }
  }
  v11 = CFURLCreateWithFileSystemPath(0, CFSTR("/System/Library/PrivateFrameworks/InternationalSupport.framework"), kCFURLPOSIXPathStyle, 1u);
  if (!v11)
    goto LABEL_35;
  v12 = v11;
  v13 = CFBundleCreate(0, v11);
  CFRelease(v12);
  if (!v13)
    goto LABEL_35;
  if (!CFBundleIsExecutableLoaded(v13))
    CFBundleLoadExecutable(v13);
  if (_GetMobileAssetObjectInfo__ObjectInfoPtr)
  {
    IsExecutableLoaded = CFBundleIsExecutableLoaded(v13);
    if (FunctionPointerForName && IsExecutableLoaded)
    {
      v15 = ((uint64_t (*)(const __CFString *))FunctionPointerForName)(CFSTR("NSLocale"));
      v16 = (_QWORD *)_GetMobileAssetObjectInfo__ObjectInfoPtr;
      *(_QWORD *)(_GetMobileAssetObjectInfo__ObjectInfoPtr + 64) = v15;
LABEL_36:
      if (!*v16
        || !v16[1]
        || !v16[2]
        || !v16[3]
        || !v16[4]
        || !v16[5]
        || !v16[6]
        || !v16[10]
        || !v16[11]
        || !v16[12]
        || !v16[13]
        || !v16[14])
      {
        free(v16);
        _GetMobileAssetObjectInfo__ObjectInfoPtr = 0;
      }
      return;
    }
LABEL_35:
    v16 = (_QWORD *)_GetMobileAssetObjectInfo__ObjectInfoPtr;
    if (!_GetMobileAssetObjectInfo__ObjectInfoPtr)
      return;
    goto LABEL_36;
  }
}

@end
