@implementation CSStringBindingCopyCFStrings

void __CSStringBindingCopyCFStrings_block_invoke(uint64_t a1, unsigned int a2)
{
  const void *v3;
  const void *v4;

  v3 = (const void *)_CSStringCopyCFString(*(_QWORD *)(a1 + 40), a2);
  if (v3)
  {
    v4 = v3;
    CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v3);
    CFRelease(v4);
  }
}

@end
