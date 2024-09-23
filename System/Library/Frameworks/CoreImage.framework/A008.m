@implementation A008

_QWORD *__providerGetBytesAtPositionCallback_A008_surface_block_invoke(_QWORD *result, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char v6;

  if (result[6])
  {
    v2 = 0;
    v3 = result[5];
    v4 = (char *)(a2 + result[4] / 4);
    do
    {
      v5 = v3 + v2;
      *(_WORD *)v5 = 0;
      *(_BYTE *)(v5 + 2) = 0;
      v6 = *v4++;
      *(_BYTE *)(v5 + 3) = v6;
      v2 += 4;
    }
    while (v2 < result[6]);
  }
  return result;
}

@end
