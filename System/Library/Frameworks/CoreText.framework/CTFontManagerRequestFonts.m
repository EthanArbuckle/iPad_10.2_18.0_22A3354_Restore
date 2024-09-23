@implementation CTFontManagerRequestFonts

void __CTFontManagerRequestFonts_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __CFArray *Mutable;
  const __CFArray *v5;
  CFIndex Count;
  CFIndex v7;
  CFIndex i;
  const __CTFontDescriptor *ValueAtIndex;
  CFArrayRef MatchingFontDescriptors;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    if (a2)
    {
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
      v5 = *(const __CFArray **)(a1 + 40);
      if (v5)
      {
        Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 40));
        if (Count)
        {
          v7 = Count;
          for (i = 0; i != v7; ++i)
          {
            ValueAtIndex = (const __CTFontDescriptor *)CFArrayGetValueAtIndex(v5, i);
            MatchingFontDescriptors = CTFontDescriptorCreateMatchingFontDescriptors(ValueAtIndex, 0);
            if (!MatchingFontDescriptors)
              CFArrayAppendValue(Mutable, ValueAtIndex);

          }
        }
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 40));
    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end
