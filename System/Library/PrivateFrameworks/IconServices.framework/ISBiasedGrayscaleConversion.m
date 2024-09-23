@implementation ISBiasedGrayscaleConversion

- (__n128)computeGrayscaleConversionColorWithWidth:(int)a3 height:(int)a4 ucharSamples:(uint64_t)a5
{
  int v7;
  float32x4_t *v8;
  uint64_t v9;
  unsigned int v10;
  _BYTE *v11;
  float32x4_t v12;
  unsigned int v13;
  unsigned int v14;
  __int128 v15;
  float32x4_t v17;
  __int128 v18;
  unsigned int v19;

  v7 = a4 * a3;
  v8 = (float32x4_t *)malloc_type_malloc(0x7D00uLL, 0x1000040451B5BE8uLL);
  v9 = 0;
  v19 = 10;
  v17 = (float32x4_t)vdupq_n_s32(0x437F0000u);
  do
  {
    *(float *)&v10 = (float)((float)v7 * (float)rand_r(&v19)) * 4.6566e-10;
    v11 = (_BYTE *)(a5 + 4 * (int)*(float *)&v10);
    LOBYTE(v10) = *v11;
    v12.f32[0] = (float)v10;
    LOBYTE(v13) = v11[1];
    LOBYTE(v14) = v11[2];
    v12.f32[1] = (float)v13;
    v12.f32[2] = (float)v14;
    v8[v9++] = vdivq_f32(v12, v17);
  }
  while (v9 != 2000);
  objc_msgSend(a1, "computeGrayscaleConversionColorWithNumberOfRepresentativeSamples:representativeSamples:", 2000, v8);
  v18 = v15;
  free(v8);
  return (__n128)v18;
}

- (double)computeGrayscaleConversionColorWithNumberOfRepresentativeSamples:(uint64_t)a3 representativeSamples:(int)a4
{
  float v7;
  float v8;
  uint64_t v9;
  float v10;
  float32x4_t v11;
  float v12;
  double v13;
  float v14;
  uint64_t v15;
  float32x4_t *v16;
  float32x4_t v17;
  float32x4_t v18;
  int v19;
  float v20;
  int v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float v27;
  double v28;
  double result;
  float v30;
  float v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  unsigned int v36;

  v7 = (float)a4;
  v8 = -3.4028e38;
  v9 = a4;
  v10 = 0.0;
  a1.i32[0] = 0;
  do
  {
    v31 = v10;
    v30 = a1.f32[0];
    a1.i32[1] = 1059481190;
    a1.i32[2] = 0.5;
    *(double *)v11.i64 = ISSegmentationMathUtils_hsv2rgb(a1);
    v33 = v11;
    v12 = 1.0
        / vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v11, 2), vaddq_f32(v11, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v11.f32, 1))).f32[0];
    v13 = ISSegmentationMathUtils_luma(v11);
    *(float *)&v13 = 0.217637641 / *(float *)&v13;
    v14 = 0.0;
    v32 = vmulq_n_f32(v33, v12 + (float)((float)(*(float *)&v13 - v12) * 0.0));
    if (a4 >= 1)
    {
      v15 = v9;
      v16 = a5;
      do
      {
        v17 = *v16++;
        v18 = vmulq_f32(v32, v17);
        v14 = v14
            + vabds_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v18, 2), vaddq_f32(v18, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v18.f32, 1))).f32[0], COERCE_FLOAT(COERCE_UNSIGNED_INT64(ISSegmentationMathUtils_luma(v17))));
        --v15;
      }
      while (v15);
    }
    v19 = 0;
    v36 = 10;
    v20 = 0.0;
    v21 = 300;
    do
    {
      v34 = a5[(float)((float)((float)((float)rand_r(&v36) * 4.6566e-10) * v7) + 0.0)];
      a1 = a5[(float)((float)((float)((float)rand_r(&v36) * 4.6566e-10) * v7) + 0.0)];
      v22 = vsubq_f32(v34, a1);
      v23 = vmulq_f32(v22, v22);
      if (sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v23, 2), vaddq_f32(v23, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v23.f32, 1))).f32[0]) > 0.0784313725)
      {
        v24 = vmulq_f32(v32, a1);
        v25 = vmulq_f32(v32, v34);
        v20 = v20
            + logf(fabsf(vsubq_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v25, 2), vaddq_f32(v25, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v25.f32, 1))), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v24, 2), vaddq_f32(v24, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v24.f32, 1)))).f32[0])+ 1.0);
        ++v19;
      }
      --v21;
    }
    while (v21);
    v10 = v31;
    if ((float)((float)(v20 / (float)v19)
               + (float)((float)((float)((float)-v14 / v7) - (float)(v20 / (float)v19)) * 0.3)) > v8)
    {
      v10 = v30;
      v8 = (float)(v20 / (float)v19) + (float)((float)((float)((float)-v14 / v7) - (float)(v20 / (float)v19)) * 0.3);
    }
    a1.f32[0] = v30 + 0.02;
  }
  while (a1.f32[0] < 1.0);
  a1.f32[0] = fminf(v10 - floorf(v10), 1.0);
  a1.i32[1] = 1059481190;
  a1.i32[2] = 0.5;
  *(double *)v26.i64 = ISSegmentationMathUtils_hsv2rgb(a1);
  v35 = v26;
  v27 = 1.0
      / vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v26, 2), vaddq_f32(v26, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v26.f32, 1))).f32[0];
  v28 = ISSegmentationMathUtils_luma(v26);
  *(float *)&v28 = 0.217637641 / *(float *)&v28;
  *(_QWORD *)&result = vmulq_n_f32(v35, v27 + (float)((float)(*(float *)&v28 - v27) * 0.0)).u64[0];
  return result;
}

@end
