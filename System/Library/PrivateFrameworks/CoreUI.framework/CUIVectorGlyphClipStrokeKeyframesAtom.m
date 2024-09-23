@implementation CUIVectorGlyphClipStrokeKeyframesAtom

uint64_t __CUIVectorGlyphClipStrokeKeyframesAtom_block_invoke()
{
  uint64_t result;

  result = CGSVGAtomFromString(CFSTR("data-clipstroke-keyframes"));
  CUIVectorGlyphClipStrokeKeyframesAtom_atom = result;
  return result;
}

@end
