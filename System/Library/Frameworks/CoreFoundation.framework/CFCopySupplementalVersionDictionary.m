@implementation CFCopySupplementalVersionDictionary

void ___CFCopySupplementalVersionDictionary_block_invoke()
{
  const __CFString *Copy;
  void *v1;

  Copy = CFStringCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, CFSTR("/System/Cryptexes/OS/System/Library/CoreServices/SystemVersion.plist"));
  v1 = _CFCopyVersionDictionary(Copy);
  CFRelease(Copy);
  if (!v1)
    v1 = (void *)_CFCopySystemVersionDictionary();
  _CFCopySupplementalVersionDictionary_result = (uint64_t)v1;
}

@end
