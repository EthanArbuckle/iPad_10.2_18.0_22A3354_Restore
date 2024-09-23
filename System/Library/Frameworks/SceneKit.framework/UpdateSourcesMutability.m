@implementation UpdateSourcesMutability

uint64_t ____UpdateSourcesMutability_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  char v5;
  char v6;

  result = C3DMeshSourceIsMutable(a2);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_BYTE *)(v4 + 200);
  if (result | ((v5 & 4) >> 2))
    v6 = 4;
  else
    v6 = 0;
  *(_BYTE *)(v4 + 200) = v6 | v5 & 0xFB;
  return result;
}

@end
