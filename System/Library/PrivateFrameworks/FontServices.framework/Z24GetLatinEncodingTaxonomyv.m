@implementation Z24GetLatinEncodingTaxonomyv

_QWORD *___Z24GetLatinEncodingTaxonomyv_block_invoke()
{
  _QWORD *result;

  result = (_QWORD *)operator new();
  *result = 4557;
  result[1] = &gGlyphNamesUnicodeTaxonomy;
  GetLatinEncodingTaxonomy(void)::gGlyphNameToUnicodeDict = (uint64_t)result;
  return result;
}

@end
