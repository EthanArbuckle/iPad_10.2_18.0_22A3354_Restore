@implementation CGImageMetadataCopyTagMatchingImageProperty

uint64_t __CGImageMetadataCopyTagMatchingImageProperty_block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;
  uint64_t v7;
  const __CFDictionary *v8;
  uint64_t v9;
  const void *Value;
  _QWORD key[3];

  result = CFStringCompare(*(CFStringRef *)(a1 + 40), **(CFStringRef **)a2, 0);
  if (!result)
  {
    result = CFStringCompare(*(CFStringRef *)(a1 + 48), **(CFStringRef **)(a2 + 8), 0);
    if (!result)
    {
      pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 56) + 72));
      v7 = *(_QWORD *)(a1 + 56);
      if (v7)
      {
        v8 = *(const __CFDictionary **)(v7 + 24);
        if (v8)
        {
          v9 = **(_QWORD **)(a2 + 24);
          key[1] = **(_QWORD **)(a2 + 32);
          key[2] = 0;
          key[0] = v9;
          Value = CFDictionaryGetValue(v8, key);
          if (Value)
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CGImageMetadataTagCopy((uint64_t)Value);
        }
      }
      result = pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 56) + 72));
      *a3 = 1;
    }
  }
  return result;
}

@end
