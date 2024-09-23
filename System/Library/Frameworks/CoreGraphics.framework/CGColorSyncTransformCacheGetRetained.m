@implementation CGColorSyncTransformCacheGetRetained

uint64_t (*__CGColorSyncTransformCacheGetRetained_block_invoke_2())()
{
  uint64_t (*result)();
  uint64_t (*v1)();

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle)
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncTransformCreate");
  v1 = colorsync_smart_null_11226;
  if (result)
    v1 = result;
  CGColorSyncTransformCacheGetRetained_f = (uint64_t (*)(_QWORD, _QWORD))v1;
  return result;
}

void __CGColorSyncTransformCacheGetRetained_block_invoke()
{
  char *v0;
  const __CFString *v1;
  const __CFURL *v2;
  __CFBundle *MainBundleIfLooksLikeBundle;
  const __CFURL *v4;
  const __CFURL *v5;
  const __CFURL *v6;
  int v7;
  int v8;
  int v9;
  __CFReadStream *v10;
  CFPropertyListRef v11;
  CFStringRef v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CFTypeID v19;
  stat v20;
  UInt8 buffer[1025];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v0 = getenv("CGCOLORCONVERSIONINFO_PLIST_PATH");
  if (!v0
    || (v1 = CFStringCreateWithCString(0, v0, 0x8000100u),
        (v2 = CFURLCreateWithFileSystemPath(0, v1, kCFURLPOSIXPathStyle, 0)) == 0))
  {
    MainBundleIfLooksLikeBundle = (__CFBundle *)_CFBundleGetMainBundleIfLooksLikeBundle();
    if (MainBundleIfLooksLikeBundle
      && (v4 = CFBundleCopyBundleURL(MainBundleIfLooksLikeBundle)) != 0
      && (v5 = CFURLCreateWithString(0, CFSTR("Contents/Resources/CGColorConversionInfoOptions.plist"), v4)) != 0)
    {
      v6 = v5;
      v2 = CFURLCopyAbsoluteURL(v5);
      CFRelease(v6);
    }
    else
    {
      v2 = 0;
    }
  }
  bzero(buffer, 0x401uLL);
  if (!CFURLGetFileSystemRepresentation(v2, 0, buffer, 1025)
    || (v7 = open((const char *)buffer, 0, 0), v7 == -1)
    || (v8 = v7, memset(&v20, 0, sizeof(v20)), v9 = fstat(v7, &v20), close(v8), v9 == -1))
  {
    if (!v2)
      return;
    goto LABEL_19;
  }
  if (v2)
  {
    v10 = CFReadStreamCreateWithFile(0, v2);
    if (v10)
    {
      v2 = v10;
      CFReadStreamOpen(v10);
      *(_QWORD *)&v20.st_dev = 0;
      v11 = CFPropertyListCreateWithStream(0, v2, 0, 0, 0, (CFErrorRef *)&v20);
      if (*(_QWORD *)&v20.st_dev)
      {
        v12 = CFCopyDescription(*(CFTypeRef *)&v20.st_dev);
        CGLog(2, (uint64_t)"Reading %s failed: %@", v13, v14, v15, v16, v17, v18, (char)buffer);
        if (v12)
          CFRelease(v12);
        CFRelease(*(CFTypeRef *)&v20.st_dev);
        if (!v11)
          goto LABEL_25;
      }
      else
      {
        if (!v11)
        {
LABEL_25:
          CFReadStreamClose(v2);
LABEL_19:
          CFRelease(v2);
          return;
        }
        v19 = CFGetTypeID(v11);
        if (v19 == CFDictionaryGetTypeID())
          CGColorSyncTransformCacheGetRetained_bundle_options = (uint64_t)CFRetain(v11);
      }
      CFRelease(v11);
      goto LABEL_25;
    }
  }
}

@end
