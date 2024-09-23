@implementation IOHIDServiceMatchObjcServicePlugin

CFTypeID ____IOHIDServiceMatchObjcServicePlugin_block_invoke(uint64_t a1, int a2, CFTypeRef cf)
{
  CFTypeID v5;
  CFTypeID result;

  v5 = CFGetTypeID(cf);
  result = CFDictionaryGetTypeID();
  if (v5 == result)
    return IOServiceMatchPropertyTable(*(_DWORD *)(a1 + 40), (CFDictionaryRef)cf, (BOOLean_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  return result;
}

@end
