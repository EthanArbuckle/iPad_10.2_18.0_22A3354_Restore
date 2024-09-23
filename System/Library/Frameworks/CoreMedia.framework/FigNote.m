@implementation FigNote

uint64_t __FigNote_ChangeValue_block_invoke(uint64_t a1)
{
  uint64_t result;
  const __CFArray *v3;
  uint64_t v4;
  CFIndex i;

  result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)gFigNoteVariableRegistry_1, *(const void **)(a1 + 32));
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, *(const void **)(a1 + 40));
    if (result)
    {
      v3 = (const __CFArray *)result;
      result = CFArrayGetCount((CFArrayRef)result);
      if (result >= 1)
      {
        v4 = result;
        for (i = 0; i != v4; ++i)
        {
          result = (uint64_t)CFArrayGetValueAtIndex(v3, i);
          **(_DWORD **)(result + 8) = *(_DWORD *)(a1 + 56);
        }
      }
      **(_DWORD **)(a1 + 48) = 0;
    }
  }
  return result;
}

uint64_t __FigNote_GetValue_block_invoke(uint64_t a1)
{
  uint64_t result;
  const __CFArray *v3;
  _DWORD *v4;

  result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)gFigNoteVariableRegistry_1, *(const void **)(a1 + 32));
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, *(const void **)(a1 + 40));
    if (result)
    {
      v3 = (const __CFArray *)result;
      result = CFArrayGetCount((CFArrayRef)result);
      if (result >= 1)
      {
        result = (uint64_t)CFArrayGetValueAtIndex(v3, 0);
        v4 = *(_DWORD **)(a1 + 56);
        **(_DWORD **)(a1 + 48) = **(_DWORD **)(result + 8);
        *v4 = 0;
      }
    }
  }
  return result;
}

void __FigNote_CopyKeys_block_invoke(uint64_t a1)
{
  const __CFDictionary *Value;
  const __CFDictionary *v3;
  CFIndex Count;
  CFIndex v5;
  const void **v6;
  uint64_t v7;

  Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)gFigNoteVariableRegistry_1, *(const void **)(a1 + 40));
  if (Value)
  {
    v3 = Value;
    Count = CFDictionaryGetCount(Value);
    if (Count >= 1)
    {
      v5 = Count;
      v6 = (const void **)malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
      CFDictionaryGetKeysAndValues(v3, v6, 0);
      v7 = 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
      do
        CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v6[v7++]);
      while (v5 != v7);
      free(v6);
    }
  }
}

@end
