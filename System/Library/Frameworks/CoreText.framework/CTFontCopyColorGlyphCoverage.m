@implementation CTFontCopyColorGlyphCoverage

void __CTFontCopyColorGlyphCoverage_block_invoke(uint64_t a1, CFRange a2)
{
  CFIndex v2;
  CFIndex v3;
  BOOL v4;
  __CFBitVector *v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2.location + a2.length >= v2)
    v3 = *(_QWORD *)(a1 + 32);
  else
    v3 = a2.location + a2.length;
  if (a2.location < 0 || a2.location >= v2)
  {
    v4 = a2.location + a2.length > 0 && a2.location < 1;
    a2.location = 0;
    if (v4)
      a2.length = v3;
    else
      a2.length = 0;
  }
  else
  {
    a2.length = v3 - a2.location;
  }
  v5 = (__CFBitVector *)atomic_load((unint64_t *)(a1 + 40));
  CFBitVectorSetBits(v5, a2, 1u);
}

void __CTFontCopyColorGlyphCoverage_block_invoke_16(uint64_t a1, CFRange a2)
{
  CFIndex v2;
  CFIndex v3;
  BOOL v4;
  __CFBitVector *v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2.location + a2.length >= v2)
    v3 = *(_QWORD *)(a1 + 32);
  else
    v3 = a2.location + a2.length;
  if (a2.location < 0 || a2.location >= v2)
  {
    v4 = a2.location + a2.length > 0 && a2.location < 1;
    a2.location = 0;
    if (v4)
      a2.length = v3;
    else
      a2.length = 0;
  }
  else
  {
    a2.length = v3 - a2.location;
  }
  v5 = (__CFBitVector *)atomic_load((unint64_t *)(a1 + 40));
  CFBitVectorSetBits(v5, a2, 1u);
}

@end
