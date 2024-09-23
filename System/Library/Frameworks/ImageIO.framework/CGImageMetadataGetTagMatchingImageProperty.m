@implementation CGImageMetadataGetTagMatchingImageProperty

const __CFDictionary *__CGImageMetadataGetTagMatchingImageProperty_block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  const __CFDictionary *result;
  uint64_t v7;
  uint64_t v8;
  _QWORD key[3];

  result = (const __CFDictionary *)CFStringCompare(*(CFStringRef *)(a1 + 40), **(CFStringRef **)a2, 0);
  if (!result)
  {
    result = (const __CFDictionary *)CFStringCompare(*(CFStringRef *)(a1 + 48), **(CFStringRef **)(a2 + 8), 0);
    if (!result)
    {
      v7 = *(_QWORD *)(a1 + 56);
      if (v7)
      {
        result = *(const __CFDictionary **)(v7 + 24);
        if (result)
        {
          v8 = **(_QWORD **)(a2 + 24);
          key[1] = **(_QWORD **)(a2 + 32);
          key[2] = 0;
          key[0] = v8;
          result = (const __CFDictionary *)CFDictionaryGetValue(result, key);
        }
      }
      else
      {
        result = 0;
      }
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
      *a3 = 1;
    }
  }
  return result;
}

@end
