@implementation YCbYCrFull

_QWORD *__providerGetBytesAtPositionCallback_YCbYCrFull_surface_block_invoke(_QWORD *result, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unsigned __int8 *v5;
  unsigned int v6;
  unsigned int v7;
  _BYTE *v8;
  unsigned int v9;
  float v10;
  float v11;

  v2 = result[6];
  if (v2)
  {
    v3 = 0;
    v4 = result[5];
    v5 = (unsigned __int8 *)(a2 + result[4] / 2);
    do
    {
      v6 = v5[1];
      if ((((_DWORD)v3 + *((_DWORD *)result + 8)) & 4) != 0)
      {
        v7 = v5[1];
        if (v3)
          v6 = *(v5 - 1);
        else
          v6 = 128;
      }
      else if (v3 >= v2 - 4)
      {
        v7 = 128;
      }
      else
      {
        v7 = v5[3];
      }
      v8 = (_BYTE *)(v4 + v3);
      v9 = *v5;
      v5 += 2;
      v10 = (float)v6 + -128.0;
      v11 = (float)v7 + -128.0;
      *v8 = llroundf(fmaxf(fminf((float)(v11 * 1.4075) + (float)v9, 255.0), 0.0));
      v8[1] = llroundf(fmaxf(fminf((float)((float)v9 + (float)(v10 * -0.34549)) + (float)(v11 * -0.71695), 255.0), 0.0));
      v8[2] = llroundf(fmaxf(fminf((float)(v10 * 1.779) + (float)v9, 255.0), 0.0));
      v8[3] = -1;
      v3 += 4;
      v2 = result[6];
    }
    while (v3 < v2);
  }
  return result;
}

@end
