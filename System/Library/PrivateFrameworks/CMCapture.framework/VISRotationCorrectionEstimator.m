@implementation VISRotationCorrectionEstimator

- (VISRotationCorrectionEstimator)initWithTimeScale:(float)a3
{
  VISRotationCorrectionEstimator *v4;
  VISRotationCorrectionEstimator *v5;
  HighPassIIR2FilterFloat3 *v6;
  HighPassIIR2FilterFloat3 *highPassFilter1;
  HighPassIIR2FilterFloat3 *v8;
  HighPassIIR2FilterFloat3 *highPassFilter2;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VISRotationCorrectionEstimator;
  v4 = -[VISRotationCorrectionEstimator init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_timeScale = a3 * 0.70711;
    v6 = objc_alloc_init(HighPassIIR2FilterFloat3);
    highPassFilter1 = v5->highPassFilter1;
    v5->highPassFilter1 = v6;

    v8 = objc_alloc_init(HighPassIIR2FilterFloat3);
    highPassFilter2 = v5->highPassFilter2;
    v5->highPassFilter2 = v8;

    -[VISRotationCorrectionEstimator reset](v5, "reset");
  }
  return v5;
}

- (void)reset
{
  self->_isInitialized = 0;
  self->_prevTime = 0.0;
  *(_OWORD *)self->_anon_20 = xmmword_1A32B1810;
  *(_OWORD *)self->_accumulatedCorrection = 0u;
  *(_OWORD *)self->_estimatedCorrection = 0u;
  -[HighPassIIR2FilterFloat3 reset](self->highPassFilter1, "reset");
  -[HighPassIIR2FilterFloat3 reset](self->highPassFilter2, "reset");
}

- (__n128)updateWithRotation:(double)a3 atTime:
{
  double v4;
  __n128 result;
  float32x4_t v7;
  int32x2_t v8;
  float32x4_t v9;
  int32x4_t v10;
  int8x16_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  int8x16_t v15;
  int32x2_t v16;
  float32x4_t v17;
  unsigned __int32 v18;
  float32x2_t v19;
  float32x2_t v20;
  float32x4_t v21;
  float v22;
  float32x2_t v23;
  float32x2_t v24;
  float v25;
  float32x4_t v26;
  double v27;
  void *v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  int32x2_t v34;

  v4 = *(double *)(a1 + 16);
  if (v4 <= a3)
  {
    if (*(_BYTE *)(a1 + 12))
    {
      v7 = *(float32x4_t *)(a1 + 32);
    }
    else
    {
      v4 = a3 + -0.03333;
      *(double *)(a1 + 16) = a3 + -0.03333;
      *(float32x4_t *)(a1 + 32) = a2;
      *(_BYTE *)(a1 + 12) = 1;
      v7 = a2;
    }
    *(double *)&v8 = a3 - v4;
    *(float *)v8.i32 = *(double *)v8.i32;
    v34 = v8;
    v9 = vmulq_f32(v7, (float32x4_t)xmmword_1A32A2AE0);
    v10 = (int32x4_t)vnegq_f32(a2);
    v11 = (int8x16_t)vtrn2q_s32((int32x4_t)a2, vtrn1q_s32((int32x4_t)a2, v10));
    v12 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)a2, (int8x16_t)v10, 8uLL), *(float32x2_t *)v9.f32, 1), (float32x4_t)vextq_s8(v11, v11, 8uLL), v9.f32[0]);
    v13 = (float32x4_t)vrev64q_s32((int32x4_t)a2);
    v13.i32[0] = v10.i32[1];
    v13.i32[3] = v10.i32[2];
    v14 = vaddq_f32(v12, vmlaq_laneq_f32(vmulq_laneq_f32(a2, v9, 3), v13, v9, 2));
    v15 = (int8x16_t)vmulq_f32(v14, v14);
    v16 = (int32x2_t)vadd_f32(*(float32x2_t *)v15.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v15, v15, 8uLL));
    if (vaddv_f32((float32x2_t)v16) == 0.0)
    {
      v17 = (float32x4_t)xmmword_1A32B1810;
    }
    else
    {
      v18 = vadd_f32((float32x2_t)v16, (float32x2_t)vdup_lane_s32(v16, 1)).u32[0];
      v19 = vrsqrte_f32((float32x2_t)v18);
      v20 = vmul_f32(v19, vrsqrts_f32((float32x2_t)v18, vmul_f32(v19, v19)));
      v17 = vmulq_n_f32(v14, vmul_f32(v20, vrsqrts_f32((float32x2_t)v18, vmul_f32(v20, v20))).f32[0]);
    }
    v21 = vmulq_f32(v17, v17);
    LODWORD(v22) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v21, 2), vaddq_f32(v21, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v21.f32, 1))).u32[0];
    v23 = vrsqrte_f32((float32x2_t)LODWORD(v22));
    v24 = vmul_f32(v23, vrsqrts_f32((float32x2_t)LODWORD(v22), vmul_f32(v23, v23)));
    v32 = vmulq_n_f32(v17, vmul_f32(v24, vrsqrts_f32((float32x2_t)LODWORD(v22), vmul_f32(v24, v24))).f32[0]);
    v25 = atan2f(sqrtf(v22), v17.f32[3]);
    v26 = (float32x4_t)vdupq_lane_s32(v34, 0);
    *(_QWORD *)&v27 = vdivq_f32(vmulq_n_f32(v32, v25 + v25), v26).u64[0];
    v26.f32[0] = *(float *)(a1 + 8) / (float)(*(float *)(a1 + 8) + *(float *)v34.i32);
    objc_msgSend(*(id *)(a1 + 64), "updateValue:withPole:", v27, *(double *)v26.i64);
    v28 = *(void **)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 64), "filteredValue");
    objc_msgSend(v28, "updateValue:withPole:");
    v32.f32[0] = *(float *)(a1 + 8)
               / (float)(*(float *)(a1 + 8) + (float)((float)(*(float *)v34.i32 / 400.0) * 0.70711));
    objc_msgSend(*(id *)(a1 + 72), "filteredValue");
    v30.i64[0] = 0xBF000000BF000000;
    v30.i64[1] = 0xBF000000BF000000;
    v31 = vmlaq_n_f32(vmulq_f32(vmulq_n_f32(vmulq_n_f32(v29, *(float *)v34.i32), v32.f32[0] + 1.0), v30), *(float32x4_t *)(a1 + 48), v32.f32[0]);
    *(float32x4_t *)(a1 + 80) = v31;
    *(double *)(a1 + 16) = a3;
    *(float32x4_t *)(a1 + 48) = v31;
    result = (__n128)a2;
    *(float32x4_t *)(a1 + 32) = a2;
  }
  else
  {
    objc_msgSend((id)a1, "reset");
  }
  return result;
}

- (__n128)estimatedCorrection
{
  return a1[5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->highPassFilter2, 0);
  objc_storeStrong((id *)&self->highPassFilter1, 0);
}

@end
