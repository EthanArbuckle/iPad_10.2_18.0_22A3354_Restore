@implementation NTKCropHorizontalPaddingFromSnapshot

BOOL __NTKCropHorizontalPaddingFromSnapshot_block_invoke(_QWORD *a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  unsigned __int8 *v8;
  uint64_t v9;
  unint64_t v10;
  int v11;

  v2 = a1[4];
  if (!v2)
    return 0;
  v3 = a1[7];
  v4 = a1[6] * a2;
  v5 = a1[8];
  if (*(_BYTE *)(v5 + v4 + v3))
    return 1;
  v7 = a1[5];
  v8 = (unsigned __int8 *)(v5 + v3 + v7 + v4);
  v9 = 1;
  do
  {
    v10 = v9;
    if (v2 == v9)
      break;
    v11 = *v8;
    ++v9;
    v8 += v7;
  }
  while (!v11);
  return v10 < v2;
}

uint64_t __NTKCropHorizontalPaddingFromSnapshot_block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *(double *)(a1 + 40), 0.0, *(double *)(a1 + 48), *(double *)(a1 + 56));
}

@end
