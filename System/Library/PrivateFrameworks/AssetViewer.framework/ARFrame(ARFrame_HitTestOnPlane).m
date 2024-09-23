@implementation ARFrame(ARFrame_HitTestOnPlane)

- (id)hitTestOnPlaneWithWorldTransform:()ARFrame_HitTestOnPlane forImagePoint:maxDistance:
{
  void *v15;
  float32x4_t v16;
  void *v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  void *v22;
  float32x4_t v23;
  int32x4_t v24;
  float32x4_t v26;
  BOOL v28;
  void *v29;
  __int128 v30;
  uint64_t v32;
  float32x4_t v37;
  double v38;
  float32x4_t v39;
  double v40;
  float32x4_t v41;
  double v42;
  float32x4_t v43;
  double v44;
  float v45;
  float32x4_t v46;
  float v47;
  float v49;
  float32x4_t v50;
  float32x4_t v51;
  __int128 v52;
  _OWORD v53[4];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  simd_float4x4 v58;
  simd_float4x4 v59;
  simd_float4x4 v60;

  v49 = vmlas_n_f32(-1.0, 2.0, *(float *)&_D4);
  _S0 = -2.0;
  __asm { FMLA            S1, S0, V4.S[1] }
  v45 = _S1;
  objc_msgSend(a1, "camera");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "projectionMatrix");
  v59 = __invert_f4(v58);
  v37 = (float32x4_t)v59.columns[0];
  v39 = (float32x4_t)v59.columns[1];
  v41 = (float32x4_t)v59.columns[3];
  v43 = (float32x4_t)v59.columns[2];

  v16 = vaddq_f32(v41, vmlaq_f32(vmlaq_n_f32(vmulq_n_f32(v37, v49), v39, v45), (float32x4_t)0, v43));
  v50 = vdivq_f32(v16, (float32x4_t)vdupq_laneq_s32((int32x4_t)v16, 3));
  objc_msgSend(a1, "camera");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "transform");
  v46 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v18, v50.f32[0]), v19, *(float32x2_t *)v50.f32, 1), v20, v50, 2), v21, v50, 3);

  objc_msgSend(a1, "camera");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "transform");
  v51 = v23;

  _Q0.columns[1] = (simd_float4)a3;
  _Q0.columns[0] = (simd_float4)vsubq_f32(v46, v51);
  v24 = (int32x4_t)vmulq_f32((float32x4_t)_Q0.columns[0], (float32x4_t)_Q0.columns[0]);
  v24.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v24, 2), vadd_f32(*(float32x2_t *)v24.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v24.i8, 1))).u32[0];
  *(float32x2_t *)_Q0.columns[2].f32 = vrsqrte_f32((float32x2_t)v24.u32[0]);
  *(float32x2_t *)_Q0.columns[2].f32 = vmul_f32(*(float32x2_t *)_Q0.columns[2].f32, vrsqrts_f32((float32x2_t)v24.u32[0], vmul_f32(*(float32x2_t *)_Q0.columns[2].f32, *(float32x2_t *)_Q0.columns[2].f32)));
  _Q0.columns[0] = (simd_float4)vmulq_n_f32((float32x4_t)_Q0.columns[0], vmul_f32(*(float32x2_t *)_Q0.columns[2].f32, vrsqrts_f32((float32x2_t)v24.u32[0], vmul_f32(*(float32x2_t *)_Q0.columns[2].f32, *(float32x2_t *)_Q0.columns[2].f32))).f32[0]);
  _Q0.columns[3] = (simd_float4)vmulq_f32(a3, (float32x4_t)_Q0.columns[0]);
  v26 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)_Q0.columns[3], 2), vaddq_f32((float32x4_t)_Q0.columns[3], (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q0.columns[3].f32, 1)));
  if (v26.f32[0] <= -0.00000011921
    && ((_Q0.columns[3] = (simd_float4)a5,
         _Q0.columns[2] = (simd_float4)vmulq_f32(a3, vsubq_f32(a5, v51)),
         _S5 = vdivq_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)_Q0.columns[2], 2), vaddq_f32((float32x4_t)_Q0.columns[2], (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q0.columns[2].f32, 1))), v26).f32[0], _S5 >= 0.0)? (v28 = _S5 <= a7): (v28 = 0), v28))
  {
    *(float32x2_t *)&v30 = vmla_n_f32(*(float32x2_t *)v51.f32, *(float32x2_t *)_Q0.columns[0].f32, _S5);
    v47 = _S5;
    __asm { FMLA            S4, S5, V0.S[2] }
    *((_QWORD *)&v30 + 1) = __PAIR64__(vextq_s8(*(int8x16_t *)&a5, *(int8x16_t *)&a5, 8uLL).u32[1], _S4);
    v52 = v30;
    _Q0.columns[0] = a2;
    _Q0.columns[2] = a4;
    v60 = __invert_f4(_Q0);
    v32 = 0;
    v53[0] = a2;
    v53[1] = a3;
    v53[2] = a4;
    v53[3] = v52;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    do
    {
      *(__int128 *)((char *)&v54 + v32 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v60.columns[0], COERCE_FLOAT(v53[v32])), (float32x4_t)v60.columns[1], *(float32x2_t *)&v53[v32], 1), (float32x4_t)v60.columns[2], (float32x4_t)v53[v32], 2), (float32x4_t)v60.columns[3], (float32x4_t)v53[v32], 3);
      ++v32;
    }
    while (v32 != 4);
    v42 = *(double *)&v56;
    v44 = *(double *)&v57;
    v38 = *(double *)&v54;
    v40 = *(double *)&v55;
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2110]), "initWithType:", 2);
    objc_msgSend(v29, "setAnchor:", 0);
    objc_msgSend(v29, "setDistance:", v47);
    objc_msgSend(v29, "setWorldTransform:", *(double *)a2.i64, *(double *)a3.i64, *(double *)a4.i64, *(double *)&v52);
    objc_msgSend(v29, "setLocalTransform:", v38, v40, v42, v44);
  }
  else
  {
    v29 = 0;
  }
  return v29;
}

@end
