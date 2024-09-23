@implementation ZNK5EQKit4Font22OpenTypeFontCollection40newCGPathForStretchedCharacterWithScriptEjN10EQKitTypes4Axis4EnumEdRKNS

const void **___ZNK5EQKit4Font22OpenTypeFontCollection40newCGPathForStretchedCharacterWithScriptEjN10EQKitTypes4Axis4EnumEdRKNS_6Script4InfoERN9EQKitPath4InfoE_block_invoke(uint64_t a1, uint64_t a2, unsigned __int16 *a3)
{
  const __CTFont *v5;
  CGGlyph GlyphID;
  CGPathRef PathForGlyph;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  CGAffineTransform v13;
  CGPathRef v14;

  v5 = *(const __CTFont **)(a1 + 40);
  GlyphID = GlyphPartRecordGetGlyphID(a3);
  PathForGlyph = CTFontCreatePathForGlyph(v5, GlyphID, 0);
  v14 = PathForGlyph;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(double *)(v8 + 24);
  if (v9 > 0.0)
    *(double *)(v8 + 24) = v9 - *(double *)(a1 + 48);
  memset(&v13, 0, sizeof(v13));
  if (*(_DWORD *)(a1 + 80) == 2)
  {
    v10 = 0.0;
    v11 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) * *(double *)(a1 + 64);
  }
  else
  {
    v11 = 0.0;
    v10 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) * *(double *)(a1 + 64);
  }
  CGAffineTransformMakeTranslation(&v13, v10, v11);
  CGPathAddPath(*(CGMutablePathRef *)(a1 + 72), &v13, PathForGlyph);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24)
                                                              + (double)GlyphPartRecordGetFullAdvance((uint64_t)a3);
  return EQKit::AutoCFType<CGPath const*>::~AutoCFType((const void **)&v14);
}

@end
