@implementation PageRemoveAnnotation

void __PageRemoveAnnotation_block_invoke(uint64_t a1, uint64_t a2, CFArrayRef theArray)
{
  uint64_t v5;
  uint64_t v6;
  const void *v7;
  _DWORD *Value;
  const void *v9;
  uint64_t v10;
  CFIndex idx;

  v10 = 0;
  idx = 0;
  AppendModeFindAnnotation((char *)a2, theArray, *(_QWORD *)(a1 + 32), &idx, &v10);
  if (v10)
  {
    v5 = *(_QWORD *)(v10 + 16);
    v6 = *(_QWORD *)(v10 + 24);
    CFArrayRemoveValueAtIndex(theArray, idx);
    v7 = (const void *)CGPDFReferenceCreate(v5, v6);
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a2 + 16), v7);
    if (Value)
    {
      Value[8] = 1;
    }
    else
    {
      v9 = (const void *)AppendModeObjectCreate(1, v5, v6, 0);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a2 + 16), v7, v9);
      CFRelease(v9);
    }
    CFRelease(v7);
  }
}

@end
