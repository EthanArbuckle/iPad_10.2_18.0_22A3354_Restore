@implementation CFCopySystemVersionPlatformDictionary

void ___CFCopySystemVersionPlatformDictionary_block_invoke()
{
  const __CFString *Copy;
  void *v1;

  Copy = CFStringCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, CFSTR("/System/Library/CoreServices/.SystemVersionPlatform.plist"));
  v1 = _CFCopyVersionDictionary(Copy);
  CFRelease(Copy);
  if (!v1)
    v1 = (void *)_CFCopySystemVersionDictionary();
  _CFCopySystemVersionPlatformDictionary_result = (uint64_t)v1;
}

@end
