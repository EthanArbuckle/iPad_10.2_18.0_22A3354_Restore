@implementation CoverageTableGetIndexOfGlyphID

uint64_t __CoverageTableGetIndexOfGlyphID_block_invoke(uint64_t a1, uint64_t a2, unsigned __int16 *a3)
{
  return *(unsigned __int16 *)(a1 + 32) - (bswap32(*a3) >> 16);
}

uint64_t __CoverageTableGetIndexOfGlyphID_block_invoke_2(uint64_t a1, uint64_t a2, unsigned __int16 *a3)
{
  unsigned int v3;

  v3 = *(unsigned __int16 *)(a1 + 32);
  if (v3 >= bswap32(*a3) >> 16)
    return v3 > bswap32(a3[1]) >> 16;
  else
    return 0xFFFFFFFFLL;
}

@end
