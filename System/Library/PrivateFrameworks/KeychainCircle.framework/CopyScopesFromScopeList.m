@implementation CopyScopesFromScopeList

void __CopyScopesFromScopeList_block_invoke(uint64_t a1, const __CFString *cf)
{
  CFTypeID v4;
  __CFString *MutableCopy;

  if (cf)
  {
    v4 = CFGetTypeID(cf);
    if (v4 == CFStringGetTypeID())
    {
      MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, cf);
      CFStringTrimWhitespace(MutableCopy);
      CFSetSetValue(*(CFMutableSetRef *)(a1 + 32), MutableCopy);
      if (MutableCopy)
        CFRelease(MutableCopy);
    }
  }
}

@end
