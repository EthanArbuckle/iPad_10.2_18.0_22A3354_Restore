@implementation CFICUCreateVariableNameForStackPointerIfNeeded

void _____CFICUCreateVariableNameForStackPointerIfNeeded_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const char *v3;
  CFStringRef v4;
  const __CFString *v5;
  const void *Value;
  const __CFString *v7;
  _BYTE *v8;

  v3 = *(const char **)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 48);
  v4 = CFStringCreateWithCString(0, v3, 0x8000100u);
  if (stackPointersByPrefix)
    CFDictionaryGetValue((CFDictionaryRef)stackPointersByPrefix, v4);
  if (v2 || (Value = CFDictionaryGetValue((CFDictionaryRef)lastStackPointerVariableNamesByPrefix, v4)) == 0)
  {
    v5 = 0;
  }
  else
  {
    v5 = (const __CFString *)CFRetain(Value);
    v7 = CFStringCreateWithCString(0, v3, 0x8000100u);
    if (!CFStringHasPrefix(v5, v7))
    {
      CFDictionaryRemoveValue((CFMutableDictionaryRef)variableNamesByHeapPointer, 0);
      CFRelease(v5);
      v5 = 0;
    }
    CFRelease(v7);
  }
  CFRelease(v4);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = ___CFICUCreateVariableNameForStackPointerLocked(*(char **)(a1 + 40), *(const void **)(a1 + 48));
    v8 = *(_BYTE **)(a1 + 56);
    if (v8)
      *v8 = 1;
  }
}

@end
