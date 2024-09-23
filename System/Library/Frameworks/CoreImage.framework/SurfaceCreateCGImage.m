@implementation SurfaceCreateCGImage

float __SurfaceCreateCGImage_block_invoke(uint64_t a1, float *a2, uint64_t a3)
{
  int v6;
  UInt8 *MutableBytePtr;
  float result;
  uint64_t v9;
  UInt8 *v10;
  __int16 v11;
  float *v12;
  float v13;

  v6 = *(unsigned __int8 *)(a1 + 48);
  MutableBytePtr = CFDataGetMutableBytePtr(*(CFMutableDataRef *)(a1 + 32));
  v9 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    if (v9)
    {
      v10 = &MutableBytePtr[2 * a3];
      do
      {
        v11 = *(_WORD *)a2;
        a2 = (float *)((char *)a2 + 2);
        LOWORD(result) = v11;
        *(_WORD *)v10 = v11;
        v10 += 6;
        --v9;
      }
      while (v9);
    }
  }
  else if (v9)
  {
    v12 = (float *)&MutableBytePtr[4 * a3];
    do
    {
      v13 = *a2++;
      result = v13;
      *v12 = v13;
      v12 += 3;
      --v9;
    }
    while (v9);
  }
  return result;
}

@end
