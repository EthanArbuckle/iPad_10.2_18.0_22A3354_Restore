@implementation MDLTransformOrientOp

- (MDLTransformOrientOp)initWithName:(id)a3 inverse:(BOOL)a4 data:(id)a5
{
  id v9;
  id v10;
  MDLTransformOrientOp *v11;
  MDLTransformOrientOp *v12;
  MDLTransformOrientOp *v13;
  objc_super v15;

  v9 = a3;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MDLTransformOrientOp;
  v11 = -[MDLTransformOrientOp init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_animatedValue, a5);
    objc_storeStrong((id *)&v12->_name, a3);
    v12->_inverse = a4;
    v13 = v12;
  }

  return v12;
}

- (BOOL)IsInverseOp
{
  return self->_inverse;
}

- (double)float4x4AtTime:(uint64_t)a3
{
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  simd_float4x4 v15;

  objc_msgSend_floatQuaternionAtTime_(*(void **)(a1 + 24), a2, a3);
  v15.columns[1] = v15.columns[0];
  v15.columns[3].f32[0] = vmulq_f32((float32x4_t)v15.columns[0], (float32x4_t)v15.columns[0]).f32[0];
  v4 = v15.columns[0].f32[1];
  v5 = vmuls_lane_f32(v15.columns[0].f32[1], *(float32x2_t *)v15.columns[0].f32, 1);
  v6 = vmuls_lane_f32(v15.columns[0].f32[2], (float32x4_t)v15.columns[0], 2);
  v7 = vmuls_lane_f32(v15.columns[0].f32[3], (float32x4_t)v15.columns[0], 3);
  v8 = vmuls_lane_f32(v15.columns[1].f32[0], *(float32x2_t *)v15.columns[1].f32, 1);
  v9 = vmuls_lane_f32(v15.columns[0].f32[2], (float32x4_t)v15.columns[0], 3);
  v10 = vmuls_lane_f32(v15.columns[1].f32[0], (float32x4_t)v15.columns[1], 2);
  v11 = vmuls_lane_f32(v15.columns[0].f32[1], (float32x4_t)v15.columns[0], 3);
  v15.columns[2].i8[12] = 0;
  v15.columns[2].i8[13] = 0;
  v15.columns[2].i8[14] = 0;
  v15.columns[2].i8[15] = 0;
  v15.columns[0].i8[12] = 0;
  v15.columns[0].i8[13] = 0;
  v15.columns[0].i8[14] = 0;
  v15.columns[0].i8[15] = 0;
  v15.columns[0].f32[0] = (float)(v15.columns[3].f32[0] - (float)(v5 + v6)) + v7;
  v15.columns[0].f32[1] = (float)(v8 + v9) + (float)(v8 + v9);
  v12 = (float)(v8 - v9) + (float)(v8 - v9);
  v13 = vmuls_lane_f32(v4, (float32x4_t)v15.columns[1], 2);
  v14 = vmuls_lane_f32(v15.columns[1].f32[0], (float32x4_t)v15.columns[1], 3);
  v15.columns[1].i8[12] = 0;
  v15.columns[1].i8[13] = 0;
  v15.columns[1].i8[14] = 0;
  v15.columns[1].i8[15] = 0;
  v15.columns[1].f32[0] = v12;
  v15.columns[1].f32[1] = (float)(v5 + v7) - (float)(v6 + v15.columns[3].f32[0]);
  v15.columns[2].f32[0] = (float)(v10 + v11) + (float)(v10 + v11);
  v15.columns[2].f32[1] = (float)(v13 - v14) + (float)(v13 - v14);
  v15.columns[2].f32[2] = (float)(v6 + v7) - (float)(v15.columns[3].f32[0] + v5);
  v15.columns[3] = (simd_float4)xmmword_1DCC584A0;
  if (*(_BYTE *)(a1 + 8))
  {
    v15.columns[0].f32[2] = (float)(v10 - v11) + (float)(v10 - v11);
    v15.columns[1].f32[2] = (float)(v13 + v14) + (float)(v13 + v14);
    v15.columns[0].i64[0] = (unint64_t)__invert_f4(v15);
  }
  return *(double *)v15.columns[0].i64;
}

- (double)double4x4AtTime:(uint64_t)a3@<X2>
{
  void *v6;
  float64x2_t v7;
  float64x2_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  double v21;
  double v22;
  __int128 v23;
  double result;
  float64x2_t v25;
  float64x2_t v26;

  v6 = *(void **)(a1 + 24);
  if (v6)
  {
    objc_msgSend_doubleQuaternionAtTime_(v6, a2, a3);
    v7 = v25;
    v8 = v26;
  }
  else
  {
    v7 = 0uLL;
    v8 = 0uLL;
  }
  v9 = vmuld_n_f64(v7.f64[0], v7.f64[0]);
  v10 = vmuld_lane_f64(v7.f64[1], v7, 1);
  v11 = vmuld_n_f64(v8.f64[0], v8.f64[0]);
  v12 = vmuld_lane_f64(v8.f64[1], v8, 1);
  *(double *)&v17 = v9 - (v10 + v11) + v12;
  v13 = vmuld_lane_f64(v7.f64[0], v7, 1);
  v14 = vmuld_lane_f64(v8.f64[0], v8, 1);
  v15 = vmuld_n_f64(v7.f64[0], v8.f64[0]);
  v16 = vmuld_lane_f64(v7.f64[1], v8, 1);
  *((double *)&v17 + 1) = v13 + v14 + v13 + v14;
  *((_QWORD *)&v18 + 1) = 0;
  *((_QWORD *)&v19 + 1) = 0;
  *(double *)&v20 = v13 - v14 + v13 - v14;
  v21 = vmuld_lane_f64(v8.f64[0], v7, 1);
  v22 = vmuld_lane_f64(v7.f64[0], v8, 1);
  v7.f64[1] = 0.0;
  if (*(_BYTE *)(a1 + 8))
  {
    __invert_d4();
  }
  else
  {
    *(_OWORD *)a4 = v17;
    *(double *)&v19 = v15 - v16 + v15 - v16;
    *(_OWORD *)(a4 + 16) = v19;
    *((double *)&v20 + 1) = v10 + v12 - (v11 + v9);
    *(_OWORD *)(a4 + 32) = v20;
    v7.f64[0] = v21 + v22 + v21 + v22;
    *(float64x2_t *)(a4 + 48) = v7;
    *((double *)&v23 + 1) = v21 - v22 + v21 - v22;
    *(double *)&v23 = v15 + v16 + v15 + v16;
    *(_OWORD *)(a4 + 64) = v23;
    *(double *)&v18 = v11 + v12 - (v9 + v10);
    *(_OWORD *)(a4 + 80) = v18;
    *(_QWORD *)(a4 + 96) = 0;
    *(_QWORD *)(a4 + 104) = 0;
    result = 0.0;
    *(_OWORD *)(a4 + 112) = xmmword_1DCC588A0;
  }
  return result;
}

- (NSString)name
{
  return self->_name;
}

- (MDLAnimatedQuaternion)animatedValue
{
  return self->_animatedValue;
}

- (BOOL)inverse
{
  return self->_inverse;
}

- (void)setInverse:(BOOL)a3
{
  self->_inverse = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedValue, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
