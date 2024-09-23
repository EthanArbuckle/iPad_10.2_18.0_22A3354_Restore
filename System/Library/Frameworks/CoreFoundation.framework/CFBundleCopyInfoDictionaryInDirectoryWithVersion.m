@implementation CFBundleCopyInfoDictionaryInDirectoryWithVersion

BOOL ___CFBundleCopyInfoDictionaryInDirectoryWithVersion_block_invoke(uint64_t a1, CFStringRef theString)
{
  CFIndex Length;
  CFIndex v5;
  CFRange v7;
  CFRange v8;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    Length = CFStringGetLength(theString);
    if (Length == *(_QWORD *)(a1 + 48))
    {
      v7.length = Length;
      v7.location = 0;
      if (CFStringCompareWithOptions(theString, CFSTR("Info-iphoneos.plist"), v7, 9uLL) == kCFCompareEqualTo)
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFURLCreateWithString((CFAllocatorRef)&__kCFAllocatorSystemDefault, *(CFStringRef *)(a1 + 56), *(CFURLRef *)(a1 + 64));
    }
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v5 = CFStringGetLength(theString);
    if (v5 == *(_QWORD *)(a1 + 72))
    {
      v8.length = v5;
      v8.location = 0;
      if (CFStringCompareWithOptions(theString, CFSTR("Info.plist"), v8, 9uLL) == kCFCompareEqualTo)
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CFURLCreateWithString((CFAllocatorRef)&__kCFAllocatorSystemDefault, *(CFStringRef *)(a1 + 80), *(CFURLRef *)(a1 + 64));
    }
  }
  return !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
      || !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

@end
