@implementation ProcessSkinnedGeometryForJointIndex

void ____ProcessSkinnedGeometryForJointIndex_block_invoke(uint64_t a1, int a2, uint8x8_t a3, uint8x8_t a4, uint8x8_t a5, uint8x8_t a6, uint64_t a7, uint64_t a8, int a9, int a10, int a11, int a12, _BYTE *a13)
{
  int v14;
  int v17;
  BOOL v18;
  int v19;
  int v20;
  uint64_t v21;
  int v22;
  int16x4_t v23;
  int16x4_t v24;
  int8x8_t v25;
  float32x4_t v26;
  uint64_t v28;
  int v29;
  uint64_t v30;
  float32x4_t v31;
  uint64_t v32;
  float32x4_t v33;
  uint64_t v34;
  float32x4_t v35;
  float32x4_t v36;
  float v37;
  float v38;
  float32x4_t v39;
  float v40;
  float v41;
  uint64_t v42;
  unsigned int v43;
  float32x4_t *v44;
  float32x4_t v45;
  float32x4_t v46;
  __int128 v47;
  float32x4_t v48;
  __n128 v49;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  float32x4_t v53;
  float v54;
  float v55;
  float32x4_t v57;
  float32x4_t v58;

  v14 = a8;
  v17 = *(_DWORD *)(a1 + 232);
  v18 = v17 == 1;
  if (v17 == 1)
    v19 = a11;
  else
    v19 = a10;
  if (v18)
    v20 = a10;
  else
    v20 = a11;
  v21 = *(_QWORD *)(a1 + 112);
  v22 = *(unsigned __int8 *)(a1 + 125);
  a3.i32[0] = *(_DWORD *)(v21 + (v19 * v22));
  v26 = (float32x4_t)vmovl_u8(a3);
  a4.i32[0] = *(_DWORD *)(v21 + (v20 * v22));
  a5.i32[0] = *(_DWORD *)(v21 + (v22 * a12));
  v23 = (int16x4_t)vmovl_u8(a5).u64[0];
  a6.i32[0] = *(_DWORD *)(a1 + 236);
  v24 = (int16x4_t)vmovl_u8(a6).u64[0];
  *(int8x8_t *)v26.f32 = vorr_s8((int8x8_t)vceq_s16(*(int16x4_t *)v26.f32, v24), (int8x8_t)vceq_s16((int16x4_t)*(_OWORD *)&vmovl_u8(a4), v24));
  v25 = (int8x8_t)vceq_s16(v23, v24);
  *(int8x8_t *)v26.f32 = vorr_s8(*(int8x8_t *)v26.f32, v25);
  *(int8x8_t *)v26.f32 = vuzp1_s8(*(int8x8_t *)v26.f32, *(int8x8_t *)v26.f32);
  v26.i8[0] = vmaxv_u8(*(uint8x8_t *)v26.f32);
  if (v26.i8[0] < 0)
  {
    if (*(_BYTE *)(a1 + 240))
    {
      v28 = *(_QWORD *)(a1 + 128);
      v29 = *(unsigned __int8 *)(a1 + 141);
      v30 = v28 + (v19 * v29);
      v31.i64[0] = *(_QWORD *)v30;
      v31.i64[1] = *(unsigned int *)(v30 + 8);
      v32 = v28 + (v20 * v29);
      v33.i64[0] = *(_QWORD *)v32;
      v33.i64[1] = *(unsigned int *)(v32 + 8);
      v34 = v28 + (v29 * a12);
      v35.i64[0] = *(_QWORD *)v34;
      v35.i64[1] = *(unsigned int *)(v34 + 8);
    }
    else
    {
      *(double *)v36.i64 = C3DConvertFloatingTypeToFloat4(*(unsigned __int8 *)(a1 + 140), (float *)(*(_QWORD *)(a1 + 128) + v19 * *(unsigned __int8 *)(a1 + 141)), v26, *(float *)v25.i32, *(float *)v23.i32);
      v58 = v36;
      *(double *)v39.i64 = C3DConvertFloatingTypeToFloat4(*(unsigned __int8 *)(a1 + 140), (float *)(*(_QWORD *)(a1 + 128) + v20 * *(unsigned __int8 *)(a1 + 141)), v36, v37, v38);
      v57 = v39;
      *(double *)v35.i64 = C3DConvertFloatingTypeToFloat4(*(unsigned __int8 *)(a1 + 140), (float *)(*(_QWORD *)(a1 + 128) + *(unsigned __int8 *)(a1 + 141) * a12), v39, v40, v41);
      v33 = v57;
      v31 = v58;
    }
    *(float32x4_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32) = vminq_f32(*(float32x4_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)+ 32), v31);
    *(float32x4_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32) = vminq_f32(*(float32x4_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)+ 32), v33);
    *(float32x4_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32) = vminq_f32(*(float32x4_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)+ 32), v35);
    *(float32x4_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 32) = vmaxq_f32(*(float32x4_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)+ 32), v31);
    *(float32x4_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 32) = vmaxq_f32(*(float32x4_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)+ 32), v33);
    *(float32x4_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 32) = vmaxq_f32(*(float32x4_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)+ 32), v35);
    *(float32x4_t *)(*(_QWORD *)(a1 + 144)
                   + 16 * (3 * *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))) = v31;
    *(float32x4_t *)(*(_QWORD *)(a1 + 144)
                   + 16 * (3 * *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) + 1)) = v33;
    *(float32x4_t *)(*(_QWORD *)(a1 + 144)
                   + 16 * (3 * *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) + 2)) = v35;
    *(_DWORD *)(*(_QWORD *)(a1 + 152)
              + 4 * (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))++) = a2;
  }
  v42 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  v43 = *(_DWORD *)(v42 + 24);
  if (v43 > 0x1F || v14 - 3 == a9 && *(_DWORD *)(a1 + 168) - 1 == a2)
  {
    *(_DWORD *)(v42 + 24) = 0;
    v44 = *(float32x4_t **)(*(_QWORD *)(a1 + 80) + 8);
    v45 = v44[2];
    v46 = *(float32x4_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 32);
    v44[2] = (float32x4_t)vdupq_n_s32(0x7F7FFFFFu);
    *(_QWORD *)&v47 = 0x80000000800000;
    *((_QWORD *)&v47 + 1) = 0x80000000800000;
    *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 32) = v47;
    v48 = *(float32x4_t *)(a1 + 32);
    v49 = *(__n128 *)(a1 + 64);
    v50 = vmulq_f32((float32x4_t)v49, vsubq_f32(v45, v48));
    v51 = vmulq_f32((float32x4_t)v49, vsubq_f32(v46, v48));
    v50.i32[3] = 0;
    v51.i32[3] = 0;
    v52 = vminnmq_f32(v50, v51);
    v53 = vmaxnmq_f32(v50, v51);
    v54 = v52.f32[2];
    if (v52.f32[0] >= v52.f32[2])
      v54 = v52.f32[0];
    if (v54 < v52.f32[1])
      v54 = v52.f32[1];
    v55 = v53.f32[2];
    if (v53.f32[0] <= v53.f32[2])
      v55 = v53.f32[0];
    v53.i32[0] = v53.i32[1];
    if (v55 <= v53.f32[1])
      v53.f32[0] = v55;
    if (v53.f32[0] >= v54
      && v54 < v49.n128_f32[3]
      && __ProcessTriangleIndicesBatch(*(_QWORD *)(a1 + 144), *(_QWORD *)(a1 + 152), v43, v48, *(float32x4_t *)(a1 + 48), v49, a8, *(_BYTE *)(a1 + 241), *(_QWORD *)(a1 + 224)))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 1;
      *a13 = 1;
    }
  }
}

@end
