@implementation CFBundleCopyLProjDirectoriesForURL

uint64_t ___CFBundleCopyLProjDirectoriesForURL_block_invoke(uint64_t a1, CFStringRef theString)
{
  CFIndex Length;
  CFRange v5;
  CFIndex v6;
  CFStringRef v7;
  __CFArray *v8;
  CFRange v10;

  Length = CFStringGetLength(theString);
  v5.length = *(_QWORD *)(a1 + 40);
  if (Length > v5.length)
  {
    v6 = Length;
    v5.location = Length - v5.length;
    if (CFStringCompareWithOptions(theString, *(CFStringRef *)(a1 + 48), v5, 0) == kCFCompareEqualTo)
    {
      v10.length = v6 - *(_QWORD *)(a1 + 40);
      v10.location = 0;
      v7 = CFStringCreateWithSubstring((CFAllocatorRef)&__kCFAllocatorSystemDefault, theString, v10);
      v8 = *(__CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      if (!v8)
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable(*(CFAllocatorRef *)(a1 + 56), 0, &kCFTypeArrayCallBacks);
        v8 = *(__CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      }
      CFArrayAppendValue(v8, v7);
      CFRelease(v7);
    }
  }
  return 1;
}

@end
