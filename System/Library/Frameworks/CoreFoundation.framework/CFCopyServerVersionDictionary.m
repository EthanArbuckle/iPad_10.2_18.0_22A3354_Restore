@implementation CFCopyServerVersionDictionary

void ___CFCopyServerVersionDictionary_block_invoke()
{
  const __CFString *Copy;
  const __CFDictionary *v1;

  Copy = CFStringCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, CFSTR("/System/Library/CoreServices/ServerVersion.plist"));
  v1 = _CFCopyVersionDictionary(Copy);
  CFRelease(Copy);
  _CFCopyServerVersionDictionary_result = (uint64_t)v1;
}

@end
