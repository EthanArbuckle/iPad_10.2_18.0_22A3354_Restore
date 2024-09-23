@implementation CFICUCopyVariableNameForHeapPointer

void _____CFICUCopyVariableNameForHeapPointer_block_invoke(uint64_t a1)
{
  const void *v2;
  const __CFString *v3;

  if (variableNamesByHeapPointer)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFDictionaryGetValue((CFDictionaryRef)variableNamesByHeapPointer, *(const void **)(a1 + 40));
    v2 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    if (v2)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFRetain(v2);
      v3 = CFStringCreateWithCString(0, *(const char **)(a1 + 48), 0x8000100u);
      if (!CFStringHasPrefix(*(CFStringRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v3))
      {
        CFDictionaryRemoveValue((CFMutableDictionaryRef)variableNamesByHeapPointer, *(const void **)(a1 + 40));
        CFRelease(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      }
      CFRelease(v3);
    }
  }
}

@end
