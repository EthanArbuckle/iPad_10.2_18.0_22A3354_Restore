@implementation NLEntityDetectorEnumerateEntities

void __NLEntityDetectorEnumerateEntities_block_invoke(uint64_t a1)
{
  const __CFArray *v2;
  const __CFArray *v3;
  __CFArray *v4;
  const __CFArray *v5;
  const __CFArray *v6;
  __CFArray *v7;
  CFRange v8;
  CFRange v9;

  DDScannerScanString();
  DDScannerScanString();
  v2 = (const __CFArray *)DDScannerCopyResultsWithOptions();
  if (v2)
  {
    v3 = v2;
    v4 = *(__CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v8.length = CFArrayGetCount(v2);
    v8.location = 0;
    CFArrayAppendArray(v4, v3, v8);
    CFRelease(v3);
  }
  v5 = (const __CFArray *)DDScannerCopyResultsWithOptions();
  if (v5)
  {
    v6 = v5;
    v7 = *(__CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v9.length = CFArrayGetCount(v5);
    v9.location = 0;
    CFArrayAppendArray(v7, v6, v9);
    CFRelease(v6);
  }
}

void __NLEntityDetectorEnumerateEntities_block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  __CFDictionary *Mutable;
  const __CFArray *SubResults;
  const __CFArray *v5;
  CFIndex Count;
  CFIndex v7;
  CFIndex v8;
  const __CFString *Type;
  const void *Value;
  const void *MatchedString;
  const __CFArray *v12;
  const __CFArray *v13;
  CFIndex v14;
  uint64_t v15;
  __CFDictionary *v16;
  CFIndex i;
  const __CFString *v18;
  const void *v19;
  const void *v20;
  CFIndex v23;
  const __CFArray *v24;
  __CFDictionary *theDict;
  const __CFAllocator *allocator;

  DDResultGetType();
  DDResultGetRange();
  allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  SubResults = (const __CFArray *)DDResultGetSubResults();
  if (SubResults)
  {
    v5 = SubResults;
    Count = CFArrayGetCount(SubResults);
    if (Count >= 1)
    {
      v7 = Count;
      v8 = 0;
      v24 = v5;
      theDict = Mutable;
      v23 = Count;
      do
      {
        CFArrayGetValueAtIndex(v5, v8);
        Type = (const __CFString *)DDResultGetType();
        Value = (const void *)DDResultGetValue();
        CFDictionarySetValue(Mutable, Type, Value);
        if (CFStringHasPrefix(Type, CFSTR("NUMBERS")))
        {
          MatchedString = (const void *)DDResultGetMatchedString();
          CFDictionarySetValue(Mutable, CFSTR("SPELLED"), MatchedString);
        }
        v12 = (const __CFArray *)DDResultGetSubResults();
        if (v12)
        {
          v13 = v12;
          v14 = CFArrayGetCount(v12);
          if (v14)
          {
            v15 = v14;
            v16 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
            if (v15 >= 1)
            {
              for (i = 0; i != v15; ++i)
              {
                CFArrayGetValueAtIndex(v13, i);
                v18 = (const __CFString *)DDResultGetType();
                v19 = (const void *)DDResultGetValue();
                CFDictionarySetValue(v16, v18, v19);
                if (CFStringHasPrefix(v18, CFSTR("NUMBERS")))
                {
                  v20 = (const void *)DDResultGetMatchedString();
                  CFDictionarySetValue(v16, CFSTR("SPELLED"), v20);
                }
              }
            }
            Mutable = theDict;
            CFDictionarySetValue(theDict, Type, v16);
            CFRelease(v16);
            v7 = v23;
            v5 = v24;
          }
        }
        ++v8;
      }
      while (v8 != v7);
    }
  }
  if (Mutable)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    CFRelease(Mutable);
  }
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

@end
