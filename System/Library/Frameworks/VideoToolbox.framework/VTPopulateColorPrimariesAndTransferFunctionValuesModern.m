@implementation VTPopulateColorPrimariesAndTransferFunctionValuesModern

uint64_t __VTPopulateColorPrimariesAndTransferFunctionValuesModern_block_invoke(uint64_t a1, uint64_t a2)
{
  **(_DWORD **)(a1 + 32) = *(_QWORD *)(a2 + 4);
  return 1;
}

uint64_t __VTPopulateColorPrimariesAndTransferFunctionValuesModern_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  int v18;
  float *v19;
  float v20;

  if (*(int *)(a1 + 56) <= a3)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -12905;
  }
  else
  {
    CGColorTRCGetFunction();
    CGColorFunctionGetInputRange();
    v6 = v5;
    v8 = v7;
    CGColorFunctionGetOutputRange();
    *(_OWORD *)(*(_QWORD *)(a1 + 40) + 52 * (*(_QWORD *)(a1 + 48) + a3)) = 0u;
    *(_OWORD *)(*(_QWORD *)(a1 + 40) + 52 * (*(_QWORD *)(a1 + 48) + a3) + 16) = 0u;
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 52 * (*(_QWORD *)(a1 + 48) + a3) + 32) = 0;
    if (v9 > -3.4028e38 && v10 < 3.4028e38)
    {
      v11 = *(_QWORD *)(a1 + 40) + 52 * (*(_QWORD *)(a1 + 48) + a3);
      *(_BYTE *)(v11 + 40) = 1;
      *(float *)(v11 + 44) = v9;
      *(float *)(v11 + 48) = v10;
    }
    if (v6 > -3.4028e38 && v8 < 3.4028e38)
    {
      v12 = *(_QWORD *)(a1 + 48) + a3;
      v13 = v12 < 1;
      v14 = v12 - 1;
      if (!v13)
      {
        v15 = *(_QWORD *)(a1 + 40);
        v16 = v15 + 52 * v14;
        v18 = *(unsigned __int8 *)(v16 + 40);
        v17 = (_BYTE *)(v16 + 40);
        v19 = (float *)(v17 + 4);
        if (v18)
        {
          v20 = *v19;
          if (*v19 < v6)
          {
            *v19 = v6;
            v20 = v6;
          }
          if (v20 <= v8)
            goto LABEL_16;
        }
        else
        {
          *v19 = v6;
        }
        *(float *)(v15 + 52 * v14 + 48) = v8;
LABEL_16:
        *v17 = 1;
      }
    }
  }
  return 1;
}

uint64_t __VTPopulateColorPrimariesAndTransferFunctionValuesModern_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _DWORD *v5;

  if (*(int *)(a1 + 56) <= a3)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -12905;
  }
  else
  {
    CGColorMatrixGetMatrix();
    v5 = (_DWORD *)(*(_QWORD *)(a1 + 40) + 52 * (*(_QWORD *)(a1 + 48) + a3));
    *v5 = 40;
    v5[1] = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 52 * (*(_QWORD *)(a1 + 48) + a3) + 8) = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 52 * (*(_QWORD *)(a1 + 48) + a3) + 16) = 0;
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 52 * (*(_QWORD *)(a1 + 48) + a3) + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 52 * (*(_QWORD *)(a1 + 48) + a3) + 28) = 0;
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 52 * (*(_QWORD *)(a1 + 48) + a3) + 36) = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 52 * (*(_QWORD *)(a1 + 48) + a3) + 40) = 0;
  }
  return 1;
}

uint64_t __VTPopulateColorPrimariesAndTransferFunctionValuesModern_block_invoke_4(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  const void *v6;
  _QWORD *v7;
  uint64_t v9;
  CFTypeRef v10;

  v6 = *(const void **)(*(_QWORD *)(a2 + 68) + 8 * a4);
  CGColorNxMTransformGetTransform();
  v7 = (_QWORD *)a1[7];
  if (*v7)
  {
    *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = -12905;
  }
  else
  {
    v9 = a1[6] + 52 * (a1[5] + a3);
    *(_DWORD *)v9 = 50;
    *(_BYTE *)(v9 + 40) = 0;
    if (v6)
    {
      v10 = CFRetain(v6);
      v7 = (_QWORD *)a1[7];
    }
    else
    {
      v10 = 0;
    }
    *v7 = v10;
  }
  return 1;
}

@end
