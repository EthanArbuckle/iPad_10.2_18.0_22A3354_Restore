@implementation GetSystemLibraryDirectory

CFStringRef __GetSystemLibraryDirectory_block_invoke()
{
  const __CFAllocator *v0;
  CFStringRef result;

  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (GetSystemRootDirectory_onceToken != -1)
    dispatch_once(&GetSystemRootDirectory_onceToken, &__block_literal_global_81);
  result = CFStringCreateWithFormat(v0, 0, CFSTR("%@System/Library/"), GetSystemRootDirectory_systemRootDirectory);
  GetSystemLibraryDirectory_systemLibrary = (uint64_t)result;
  return result;
}

@end
