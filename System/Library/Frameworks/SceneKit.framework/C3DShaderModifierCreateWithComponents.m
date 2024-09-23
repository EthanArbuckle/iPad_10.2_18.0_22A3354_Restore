@implementation C3DShaderModifierCreateWithComponents

void ___C3DShaderModifierCreateWithComponents_block_invoke(uint64_t a1, const __CFString *a2, const void *a3)
{
  const __CFString *v6;

  if (CFStringFind((CFStringRef)*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), a2, 0).location != -1
    || (v6 = *(const __CFString **)(*(_QWORD *)(a1 + 32) + 16)) != 0 && CFStringFind(v6, a2, 0).location != -1)
  {
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), a3, CFSTR("2"));
  }
}

@end
