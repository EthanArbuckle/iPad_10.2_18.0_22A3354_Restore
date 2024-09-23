@implementation FigFileIsFileOnExternalStorageDevice

void __FigFileIsFileOnExternalStorageDevice_block_invoke()
{
  uid_t v0;
  const __CFAllocator *v1;
  const __CFString *v2;
  const __CFString *v3;
  CFStringRef v4;
  const __CFAllocator *v5;
  passwd *v6;
  passwd v7;
  char v8[1024];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  memset(&v7, 0, sizeof(v7));
  v6 = 0;
  v0 = getuid();
  if (!getpwuid_r(v0, &v7, v8, 0x400uLL, &v6) && v6 && v7.pw_dir)
  {
    v1 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    FigFileIsFileOnExternalStorageDevice_sMultiUserPathToCompare = (uint64_t)CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
    if (!FigFileIsFileOnExternalStorageDevice_sMultiUserPathToCompare)
      return;
    v2 = CFStringCreateWithCString(v1, v7.pw_dir, 0x600u);
    if (!v2)
      return;
    v3 = v2;
    CFStringAppend((CFMutableStringRef)FigFileIsFileOnExternalStorageDevice_sMultiUserPathToCompare, v2);
    CFStringAppend((CFMutableStringRef)FigFileIsFileOnExternalStorageDevice_sMultiUserPathToCompare, CFSTR("/Library/LiveFiles/com.apple.filesystems.userfsd/"));
    v4 = CFStringCreateWithFormat(v1, 0, CFSTR("/private%@"), FigFileIsFileOnExternalStorageDevice_sMultiUserPathToCompare);
    FigFileIsFileOnExternalStorageDevice_sMultiUserPathToComparePrivate = (uint64_t)v4;
    if (!v4)
    {
LABEL_18:
      CFRelease(v3);
      return;
    }
  }
  else
  {
    v3 = 0;
    v4 = (CFStringRef)FigFileIsFileOnExternalStorageDevice_sMultiUserPathToComparePrivate;
  }
  if (!FigFileIsFileOnExternalStorageDevice_sMultiUserPathToCompare || !v4)
  {
    if (FigFileIsFileOnExternalStorageDevice_sMultiUserPathToCompare)
    {
      CFRelease((CFTypeRef)FigFileIsFileOnExternalStorageDevice_sMultiUserPathToCompare);
      FigFileIsFileOnExternalStorageDevice_sMultiUserPathToCompare = 0;
      v4 = (CFStringRef)FigFileIsFileOnExternalStorageDevice_sMultiUserPathToComparePrivate;
    }
    if (v4)
    {
      CFRelease(v4);
      FigFileIsFileOnExternalStorageDevice_sMultiUserPathToComparePrivate = 0;
    }
    v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    FigFileIsFileOnExternalStorageDevice_sMultiUserPathToCompare = (uint64_t)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], "/var/mobile/Library/LiveFiles/com.apple.filesystems.userfsd/", 0x8000100u);
    if (FigFileIsFileOnExternalStorageDevice_sMultiUserPathToCompare)
      FigFileIsFileOnExternalStorageDevice_sMultiUserPathToComparePrivate = (uint64_t)CFStringCreateWithCString(v5, "/private/var/mobile/Library/LiveFiles/com.apple.filesystems.userfsd/", 0x8000100u);
  }
  if (v3)
    goto LABEL_18;
}

@end
