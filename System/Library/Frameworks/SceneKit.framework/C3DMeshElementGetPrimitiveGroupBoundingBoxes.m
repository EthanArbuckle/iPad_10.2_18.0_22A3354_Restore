@implementation C3DMeshElementGetPrimitiveGroupBoundingBoxes

float32x4_t __C3DMeshElementGetPrimitiveGroupBoundingBoxes_block_invoke(uint64_t a1, unsigned int a2, int *a3, unsigned int a4, float32x4_t result, float32x4_t a6, float a7)
{
  uint64_t v10;
  int v11;
  uint64_t v12;
  float32x4_t v13;
  uint64_t v14;
  int v15;
  float32x4_t v16;
  __n128 *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  float32x4_t *v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;

  if (*(_BYTE *)(a1 + 144))
  {
    if (a4)
    {
      v10 = a4;
      result.i8[12] = 0;
      result.i8[13] = 0;
      result.i8[14] = 0;
      result.i8[15] = 0;
      do
      {
        v11 = *a3++;
        v12 = *(_QWORD *)(a1 + 64) + v11 * *(unsigned __int8 *)(a1 + 77);
        v13.i64[0] = *(_QWORD *)v12;
        v13.i32[2] = *(_DWORD *)(v12 + 8);
        v13.i32[3] = result.i32[3];
        *(float32x4_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = vminq_f32(*(float32x4_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 32), v13);
        *(float32x4_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = vmaxq_f32(*(float32x4_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 32), v13);
        result = v13;
        --v10;
      }
      while (v10);
    }
  }
  else if (a4)
  {
    v14 = a4;
    do
    {
      v15 = *a3++;
      *(double *)v16.i64 = C3DConvertFloatingTypeToFloat4(*(unsigned __int8 *)(a1 + 76), (float *)(*(_QWORD *)(a1 + 64) + v15 * *(unsigned __int8 *)(a1 + 77)), result, a6.f32[0], a7);
      *(float32x4_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = vminq_f32(*(float32x4_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 32), v16);
      v17 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
      a6 = (float32x4_t)v17[2];
      result = vmaxq_f32(a6, v16);
      v17[2] = (__n128)result;
      --v14;
    }
    while (v14);
  }
  if (++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) > 0x1Fu || *(_DWORD *)(a1 + 88) - 1 <= a2)
  {
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 208);
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v20 = *(unsigned int *)(v19 + 24);
    *(_DWORD *)(v19 + 24) = v20 + 1;
    v21 = (float32x4_t *)(v18 + 32 * v20);
    v22 = *(float32x4_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32);
    v23 = *(float32x4_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
    v24.i64[0] = 0x3F0000003F000000;
    v24.i64[1] = 0x3F0000003F000000;
    v25 = vmulq_f32(vaddq_f32(v22, v23), v24);
    v25.i32[3] = 1.0;
    v26 = vmulq_f32(vsubq_f32(v23, v22), v24);
    v26.i32[3] = 0;
    *v21 = v25;
    v21[1] = v26;
    *(int32x4_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = vdupq_n_s32(0x7F7FFFFFu);
    result.i64[0] = 0x80000000800000;
    result.i64[1] = 0x80000000800000;
    *(float32x4_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = result;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  return result;
}

@end
