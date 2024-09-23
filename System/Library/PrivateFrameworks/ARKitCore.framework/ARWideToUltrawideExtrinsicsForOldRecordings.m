@implementation ARWideToUltrawideExtrinsicsForOldRecordings

void __ARWideToUltrawideExtrinsicsForOldRecordings_block_invoke()
{
  uint64_t v0;
  simd_float4x4 v1;
  float32x4_t v2;
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
  uint64_t v6;
  uint64_t v7;
  __n128 v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  simd_float4 v15;
  simd_float4 v16;
  simd_float4 v17;
  float32x4_t v18;
  _OWORD v19[4];
  _OWORD v20[4];
  simd_float4x4 v21;

  v0 = MGGetProductType();
  v1.columns[0] = (simd_float4)*MEMORY[0x1E0C83FF0];
  v1.columns[1] = *(simd_float4 *)(MEMORY[0x1E0C83FF0] + 16);
  v1.columns[2] = *(simd_float4 *)(MEMORY[0x1E0C83FF0] + 32);
  v2 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 48);
  if (v0 <= 2103978417)
  {
    if (v0 == 1293446025)
    {
LABEL_13:
      v3 = (float32x4_t)xmmword_1B3BE0130;
      v2 = (float32x4_t)xmmword_1B3BE0140;
      goto LABEL_15;
    }
    if (v0 == 1371389549)
    {
LABEL_14:
      v3 = (float32x4_t)xmmword_1B3BE00B0;
      v2 = (float32x4_t)xmmword_1B3BE00C0;
      goto LABEL_15;
    }
    v3 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 48);
    if (v0 == 2080700391)
    {
      v3 = (float32x4_t)xmmword_1B3BE00F0;
      v2 = (float32x4_t)xmmword_1B3BE0100;
LABEL_15:
      v1.columns[2] = (simd_float4)xmmword_1B3BDFDE0;
      v1.columns[1] = (simd_float4)xmmword_1B3BE00D0;
      v1.columns[0] = (simd_float4)xmmword_1B3BE00E0;
    }
  }
  else
  {
    if (v0 <= 3599094682)
    {
      if (v0 != 2103978418)
      {
        v3 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 48);
        if (v0 != 2722529672)
          goto LABEL_16;
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    if (v0 == 3599094683 || (v3 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 48), v0 == 3863625342))
    {
      v3 = (float32x4_t)xmmword_1B3BE0110;
      v2 = (float32x4_t)xmmword_1B3BE0120;
      goto LABEL_15;
    }
  }
LABEL_16:
  v15 = v1.columns[0];
  v16 = v1.columns[1];
  v4 = (float32x4_t)vdupq_n_s32(0x447A0000u);
  v1.columns[3] = (simd_float4)vmulq_f32(v2, v4);
  v1.columns[3].i32[3] = v2.i32[3];
  v5 = vmulq_f32(v3, v4);
  v5.i32[3] = v3.i32[3];
  v17 = v1.columns[2];
  v18 = v5;
  v21 = __invert_f4(v1);
  v7 = 0;
  v19[0] = v15;
  v19[1] = v16;
  v19[2] = v17;
  v19[3] = v18;
  memset(v20, 0, sizeof(v20));
  do
  {
    v20[v7] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v21.columns[0], COERCE_FLOAT(v19[v7])), (float32x4_t)v21.columns[1], *(float32x2_t *)&v19[v7], 1), (float32x4_t)v21.columns[2], (float32x4_t)v19[v7], 2), (float32x4_t)v21.columns[3], (float32x4_t)v19[v7], 3);
    ++v7;
  }
  while (v7 != 4);
  v8 = ARMatrix4x3FromMatrix4x4(v6);
  DWORD2(ARWideToUltrawideExtrinsicsForOldRecordings_wideToUltrawideExtrinsics_0) = v8.n128_u32[2];
  *(_QWORD *)&ARWideToUltrawideExtrinsicsForOldRecordings_wideToUltrawideExtrinsics_0 = v8.n128_u64[0];
  DWORD2(ARWideToUltrawideExtrinsicsForOldRecordings_wideToUltrawideExtrinsics_1) = v9;
  *(_QWORD *)&ARWideToUltrawideExtrinsicsForOldRecordings_wideToUltrawideExtrinsics_1 = v10;
  DWORD2(ARWideToUltrawideExtrinsicsForOldRecordings_wideToUltrawideExtrinsics_2) = v11;
  *(_QWORD *)&ARWideToUltrawideExtrinsicsForOldRecordings_wideToUltrawideExtrinsics_2 = v12;
  DWORD2(ARWideToUltrawideExtrinsicsForOldRecordings_wideToUltrawideExtrinsics_3) = v13;
  *(_QWORD *)&ARWideToUltrawideExtrinsicsForOldRecordings_wideToUltrawideExtrinsics_3 = v14;
}

@end
