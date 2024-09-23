@implementation CTFontDrawGlyphsWithAdvancesInternal

void __CTFontDrawGlyphsWithAdvancesInternal_block_invoke(uint64_t a1, uint64_t a2, size_t count, int a4)
{
  CGContext *v5;
  const CGGlyph *v6;
  const CGSize *v7;

  v5 = *(CGContext **)(a1 + 32);
  v6 = (const CGGlyph *)(*(_QWORD *)(a1 + 40) + 2 * a2);
  v7 = (const CGSize *)(*(_QWORD *)(a1 + 48) + 16 * a2);
  if (a4)
  {
    CGContextGetShouldDrawBitmapRuns();
    CGContextSetShouldDrawBitmapRuns();
    CGContextShowGlyphsWithAdvances(v5, v6, v7, count);
    CGContextSetShouldDrawBitmapRuns();
  }
  else
  {
    CGContextShowGlyphsWithAdvances(*(CGContextRef *)(a1 + 32), (const CGGlyph *)(*(_QWORD *)(a1 + 40) + 2 * a2), v7, count);
  }
}

@end
