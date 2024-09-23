@implementation AYCbCr8

void __providerGetBytesAtPositionCallback_AYCbCr8_surface_block_invoke(_QWORD *a1, uint64_t a2, float a3)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (a1[6])
  {
    v4 = 0;
    v5 = a1[5];
    v6 = a2 + a1[4];
    do
    {
      a3 = Convert_one_YCC_to_RGB(118, 601, (_BYTE *)(v5 + v4), (_BYTE *)(v6 + v4 + 1), a3);
      *(_BYTE *)(v5 + v4 + 3) = *(_BYTE *)(v6 + v4);
      v4 += 4;
    }
    while (v4 < a1[6]);
  }
}

@end
