@implementation SLUserLibraryDirectory

void __SLUserLibraryDirectory_block_invoke()
{
  const __CFURL *v0;
  const __CFURL *v1;
  const __CFString *v2;
  const __CFString *v3;
  __CFString *MutableCopy;
  void *v5;

  v0 = (const __CFURL *)CFCopyHomeDirectoryURLForUser();
  if (v0)
  {
    v1 = v0;
    v2 = CFURLCopyFileSystemPath(v0, kCFURLPOSIXPathStyle);
    if (v2)
    {
      v3 = v2;
      MutableCopy = CFStringCreateMutableCopy(0, 0, v2);
      CFStringAppend(MutableCopy, CFSTR("/Library/"));
      CFRelease(v3);
      v5 = (void *)SLUserLibraryDirectory_userLibraryDirectory;
      SLUserLibraryDirectory_userLibraryDirectory = (uint64_t)MutableCopy;

    }
    CFRelease(v1);
  }
}

@end
