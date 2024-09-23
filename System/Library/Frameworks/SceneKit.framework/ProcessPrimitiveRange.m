@implementation ProcessPrimitiveRange

void ____ProcessPrimitiveRange_Generic_block_invoke(float32x4_t *a1, unsigned int a2, uint64_t a3, int a4, _BYTE *a5, int32x4_t a6, float32x4_t a7, float a8)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  int *v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  __int32 v21;
  uint64_t v22;
  float32x4_t v23;
  uint64_t v24;
  float32x4_t v25;
  uint64_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float v29;
  float v30;
  float32x4_t v31;
  float v32;
  float v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  int32x4_t v39;
  float32x2_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  int8x16_t v44;
  float v45;
  float32x4_t v46;
  int8x16_t v47;
  float v48;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  float v53;
  float32x4_t v54;
  float32x4_t v55;
  float32x4_t v56;
  __n128 v57;

  v12 = 0;
  v13 = (a4 - 2);
  v14 = a3 + 4;
  while (v13 != v12)
  {
    v15 = (int *)(a1[6].i8[12] ? v14 : a3);
    v16 = (int *)(a1[6].i8[12] ? a3 : v14);
    v17 = *(_DWORD *)(a3 + 4 * (v12 + 2));
    v18 = *v16;
    v19 = *v15;
    if (a1[6].i8[13])
    {
      v20 = a1[5].i64[1];
      v21 = a1[6].i32[2];
      v22 = v20 + (v21 * v19);
      v23.i64[0] = *(_QWORD *)v22;
      v23.i64[1] = *(unsigned int *)(v22 + 8);
      v24 = v20 + (v21 * v18);
      v25.i64[0] = *(_QWORD *)v24;
      v25.i64[1] = *(unsigned int *)(v24 + 8);
      v26 = v20 + (v21 * v17);
      v27.i64[0] = *(_QWORD *)v26;
      v27.i64[1] = *(unsigned int *)(v26 + 8);
    }
    else
    {
      *(double *)v28.i64 = C3DConvertFloatingTypeToFloat4(a1[6].u8[14], (float *)(a1[5].i64[1] + (a1[6].i32[2] * v19)), (float32x4_t)a6, a7.f32[0], a8);
      v56 = v28;
      *(double *)v31.i64 = C3DConvertFloatingTypeToFloat4(a1[6].u8[14], (float *)(a1[5].i64[1] + (a1[6].i32[2] * v18)), v28, v29, v30);
      v54 = v31;
      *(double *)v34.i64 = C3DConvertFloatingTypeToFloat4(a1[6].u8[14], (float *)(a1[5].i64[1] + (a1[6].i32[2] * v17)), v31, v32, v33);
      v25 = v54;
      v23 = v56;
      v27 = v34;
    }
    v35 = vsubq_f32(v25, v23);
    v36 = vsubq_f32(v27, v23);
    v37 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v36, (int32x4_t)v36), (int8x16_t)v36, 0xCuLL), vnegq_f32(v35)), v36, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v35, (int32x4_t)v35), (int8x16_t)v35, 0xCuLL));
    v38 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v37, (int32x4_t)v37), (int8x16_t)v37, 0xCuLL);
    v39 = (int32x4_t)vmulq_f32(v37, v37);
    v39.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v39.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v39, 2), *(float32x2_t *)v39.i8)).u32[0];
    v40 = vrsqrte_f32((float32x2_t)v39.u32[0]);
    v42 = vmulq_n_f32(v38, vmul_f32(v40, vrsqrts_f32((float32x2_t)v39.u32[0], vmul_f32(v40, v40))).f32[0]);
    v41 = vmulq_f32(v23, v42);
    v42.f32[3] = -vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v41, 2), vaddq_f32(v41, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v41.f32, 1))).f32[0];
    v43 = a1[3];
    v44 = (int8x16_t)vmulq_f32(v42, v43);
    v45 = vaddv_f32(vadd_f32(*(float32x2_t *)v44.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v44, v44, 8uLL)));
    if (a1[6].i8[15])
    {
      if (v45 >= 0.0)
        return;
    }
    else if (v45 == 0.0)
    {
      return;
    }
    v46 = a1[2];
    v47 = (int8x16_t)vmulq_f32(v42, v46);
    v48 = (float)-vaddv_f32(vadd_f32(*(float32x2_t *)v47.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v47, v47, 8uLL))) / v45;
    if (v48 < 0.0 || v48 > a1[4].f32[3])
      break;
    v53 = v48;
    v55 = vmlaq_n_f32(v46, v43, v48);
    v57 = (__n128)v42;
    *(double *)v50.i64 = scn_triangle_barycentric_coordinates(v23, v25, v27, v55);
    v51.i64[0] = 0xBF000000BF000000;
    v51.i64[1] = 0xBF000000BF000000;
    v52 = vabsq_f32(vaddq_f32(v50, v51));
    a7.i64[0] = 0x3F0000003F000000;
    a7.i64[1] = 0x3F0000003F000000;
    a6 = vcgeq_f32(a7, v52);
    a6.i32[3] = a6.i32[2];
    a6.i32[0] = vminvq_u32((uint32x4_t)a6);
    v14 += 4;
    ++v12;
    if (a6.i32[0] < 0)
    {
      __AddLocalResult(a1[6].i64[0], a2, 0, v12, v12 + 1, v53, v55, v57);
      if ((*(_WORD *)(a1[6].i64[0] + 8) & 0x80) != 0)
      {
        *a5 = 1;
        *(_BYTE *)(*(_QWORD *)(a1[5].i64[0] + 8) + 24) = 1;
      }
      return;
    }
  }
}

void ____ProcessPrimitiveRange_Mask_block_invoke(float32x4_t *a1, unsigned int a2, uint64_t a3, int a4, _BYTE *a5, int32x4_t a6, float32x4_t a7, float a8)
{
  uint64_t v8;
  uint64_t v13;
  uint64_t v14;
  unsigned int *v15;
  unsigned int *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int32 v21;
  uint64_t v22;
  float32x4_t v23;
  uint64_t v24;
  float32x4_t v25;
  uint64_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float v29;
  float v30;
  float32x4_t v31;
  float v32;
  float v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  int32x4_t v39;
  float32x2_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  int8x16_t v44;
  float v45;
  float32x4_t v46;
  int8x16_t v47;
  float v48;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  float v53;
  float32x4_t v54;
  float32x4_t v55;
  float32x4_t v56;
  __n128 v57;

  v8 = (a4 - 2);
  if (a4 != 2)
  {
    v13 = 0;
    v14 = a3 + 4;
    do
    {
      v15 = (unsigned int *)(a1[6].i8[12] ? v14 : a3);
      v16 = (unsigned int *)(a1[6].i8[12] ? a3 : v14);
      v17 = *(unsigned int *)(a3 + 4 * (v13 + 2));
      v18 = *v16;
      v19 = *v15;
      if (((*(_BYTE *)(*(_QWORD *)(a1[5].i64[1] + 304) + v18) & *(_BYTE *)(*(_QWORD *)(a1[5].i64[1] + 304)
                                                                                           + v19)) & *(_BYTE *)(*(_QWORD *)(a1[5].i64[1] + 304) + v17)) != 0)
        break;
      if (a1[6].i8[13])
      {
        v20 = a1[6].i64[0];
        v21 = a1[6].i32[2];
        v22 = v20 + (v21 * v19);
        v23.i64[0] = *(_QWORD *)v22;
        v23.i64[1] = *(unsigned int *)(v22 + 8);
        v24 = v20 + (v21 * v18);
        v25.i64[0] = *(_QWORD *)v24;
        v25.i64[1] = *(unsigned int *)(v24 + 8);
        v26 = v20 + (v21 * v17);
        v27.i64[0] = *(_QWORD *)v26;
        v27.i64[1] = *(unsigned int *)(v26 + 8);
      }
      else
      {
        *(double *)v28.i64 = C3DConvertFloatingTypeToFloat4(a1[6].u8[14], (float *)(a1[6].i64[0] + (a1[6].i32[2] * v19)), (float32x4_t)a6, a7.f32[0], a8);
        v56 = v28;
        *(double *)v31.i64 = C3DConvertFloatingTypeToFloat4(a1[6].u8[14], (float *)(a1[6].i64[0] + (a1[6].i32[2] * v18)), v28, v29, v30);
        v54 = v31;
        *(double *)v34.i64 = C3DConvertFloatingTypeToFloat4(a1[6].u8[14], (float *)(a1[6].i64[0] + (a1[6].i32[2] * v17)), v31, v32, v33);
        v25 = v54;
        v23 = v56;
        v27 = v34;
      }
      v35 = vsubq_f32(v25, v23);
      v36 = vsubq_f32(v27, v23);
      v37 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v36, (int32x4_t)v36), (int8x16_t)v36, 0xCuLL), vnegq_f32(v35)), v36, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v35, (int32x4_t)v35), (int8x16_t)v35, 0xCuLL));
      v38 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v37, (int32x4_t)v37), (int8x16_t)v37, 0xCuLL);
      v39 = (int32x4_t)vmulq_f32(v37, v37);
      v39.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v39.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v39, 2), *(float32x2_t *)v39.i8)).u32[0];
      v40 = vrsqrte_f32((float32x2_t)v39.u32[0]);
      v42 = vmulq_n_f32(v38, vmul_f32(v40, vrsqrts_f32((float32x2_t)v39.u32[0], vmul_f32(v40, v40))).f32[0]);
      v41 = vmulq_f32(v23, v42);
      v42.f32[3] = -vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v41, 2), vaddq_f32(v41, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v41.f32, 1))).f32[0];
      v43 = a1[3];
      v44 = (int8x16_t)vmulq_f32(v42, v43);
      v45 = vaddv_f32(vadd_f32(*(float32x2_t *)v44.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v44, v44, 8uLL)));
      if (a1[6].i8[15])
      {
        if (v45 >= 0.0)
          return;
      }
      else if (v45 == 0.0)
      {
        return;
      }
      v46 = a1[2];
      v47 = (int8x16_t)vmulq_f32(v42, v46);
      v48 = (float)-vaddv_f32(vadd_f32(*(float32x2_t *)v47.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v47, v47, 8uLL))) / v45;
      if (v48 < 0.0 || v48 > a1[4].f32[3])
        break;
      v53 = v48;
      v55 = vmlaq_n_f32(v46, v43, v48);
      v57 = (__n128)v42;
      *(double *)v50.i64 = scn_triangle_barycentric_coordinates(v23, v25, v27, v55);
      v51.i64[0] = 0xBF000000BF000000;
      v51.i64[1] = 0xBF000000BF000000;
      v52 = vabsq_f32(vaddq_f32(v50, v51));
      a7.i64[0] = 0x3F0000003F000000;
      a7.i64[1] = 0x3F0000003F000000;
      a6 = vcgeq_f32(a7, v52);
      a6.i32[3] = a6.i32[2];
      a6.i32[0] = vminvq_u32((uint32x4_t)a6);
      if (a6.i32[0] < 0)
      {
        __AddLocalResult(a1[5].i64[1], a2, 0, v13 + 1, v13 + 2, v53, v55, v57);
        if ((*(_WORD *)(a1[5].i64[1] + 8) & 0x80) != 0)
        {
          *a5 = 1;
          *(_BYTE *)(*(_QWORD *)(a1[5].i64[0] + 8) + 24) = 1;
          return;
        }
      }
      ++v13;
      v14 += 4;
    }
    while (v8 != v13);
  }
}

@end
