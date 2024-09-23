@implementation CFBundleCopyLimitedInfoPlistKeys

void ___CFBundleCopyLimitedInfoPlistKeys_block_invoke(uint64_t a1, void *value)
{
  CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 32), value, value);
}

void ___CFBundleCopyLimitedInfoPlistKeys_block_invoke_2(CFDictionaryRef *a1, CFArrayRef theArray)
{
  const void *ValueAtIndex;
  const void *Value;
  const void *v6;
  __CFArray *MutableCopy;

  if (CFArrayGetCount(theArray) >= 1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(theArray, 0);
    Value = CFDictionaryGetValue(a1[4], ValueAtIndex);
    if (Value && (v6 = Value, !CFEqual(ValueAtIndex, Value)))
    {
      MutableCopy = CFArrayCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, theArray);
      CFArraySetValueAtIndex(MutableCopy, 0, v6);
      CFSetAddValue(a1[5], MutableCopy);
      CFRelease(MutableCopy);
    }
    else
    {
      CFSetAddValue(a1[5], theArray);
    }
    CFSetAddValue(a1[6], ValueAtIndex);
  }
}

@end
