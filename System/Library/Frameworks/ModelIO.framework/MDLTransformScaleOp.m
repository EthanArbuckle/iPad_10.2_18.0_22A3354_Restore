@implementation MDLTransformScaleOp

- (MDLTransformScaleOp)initWithName:(id)a3 inverse:(BOOL)a4 data:(id)a5
{
  id v9;
  id v10;
  MDLTransformScaleOp *v11;
  MDLTransformScaleOp *v12;
  MDLTransformScaleOp *v13;
  objc_super v15;

  v9 = a3;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MDLTransformScaleOp;
  v11 = -[MDLTransformScaleOp init](&v15, sel_init);
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
  simd_float4x4 v4;

  objc_msgSend_float3AtTime_(*(void **)(a1 + 24), a2, a3);
  v4.columns[3] = v4.columns[0];
  v4.columns[0] = (simd_float4)v4.columns[0].u32[0];
  v4.columns[1].i8[0] = 0;
  v4.columns[1].i8[1] = 0;
  v4.columns[1].i8[2] = 0;
  v4.columns[1].i8[3] = 0;
  v4.columns[1].i8[8] = 0;
  v4.columns[1].i8[9] = 0;
  v4.columns[1].i8[10] = 0;
  v4.columns[1].i8[11] = 0;
  v4.columns[1].i8[12] = 0;
  v4.columns[1].i8[13] = 0;
  v4.columns[1].i8[14] = 0;
  v4.columns[1].i8[15] = 0;
  v4.columns[1].i32[1] = v4.columns[3].i32[1];
  v4.columns[2].i8[0] = 0;
  v4.columns[2].i8[1] = 0;
  v4.columns[2].i8[2] = 0;
  v4.columns[2].i8[3] = 0;
  v4.columns[2].i8[4] = 0;
  v4.columns[2].i8[5] = 0;
  v4.columns[2].i8[6] = 0;
  v4.columns[2].i8[7] = 0;
  v4.columns[2].i8[12] = 0;
  v4.columns[2].i8[13] = 0;
  v4.columns[2].i8[14] = 0;
  v4.columns[2].i8[15] = 0;
  v4.columns[2].i32[2] = v4.columns[3].i32[2];
  v4.columns[3] = (simd_float4)xmmword_1DCC584A0;
  if (*(_BYTE *)(a1 + 8))
    v4.columns[0].i64[0] = (unint64_t)__invert_f4(v4);
  return *(double *)v4.columns[0].i64;
}

- (double)double4x4AtTime:(uint64_t)a3@<X2>
{
  void *v10;
  __int128 v11;
  int8x16_t v12;
  unint64_t v13;
  __int128 v14;
  double result;
  int8x16_t v16;
  uint64_t v17;

  v10 = *(void **)(a1 + 24);
  *(_QWORD *)&v11 = 0;
  if (v10)
  {
    objc_msgSend_double3AtTime_(v10, a2, a3, a5, a6, a7, a8, 0.0);
    *(_QWORD *)&v11 = 0;
    v12 = v16;
    v13 = vextq_s8(v12, v12, 8uLL).u64[0];
    *(_QWORD *)&v14 = v17;
  }
  else
  {
    v12.i64[0] = 0;
    v13 = 0;
    *(_QWORD *)&v14 = 0;
  }
  v12.i64[1] = 0;
  *((_QWORD *)&v14 + 1) = 0;
  *((_QWORD *)&v11 + 1) = v13;
  if (*(_BYTE *)(a1 + 8))
  {
    __invert_d4();
  }
  else
  {
    *(int8x16_t *)a4 = v12;
    *(_OWORD *)(a4 + 16) = 0uLL;
    *(_OWORD *)(a4 + 32) = v11;
    *(_OWORD *)(a4 + 48) = 0uLL;
    *(_OWORD *)(a4 + 64) = 0uLL;
    *(_OWORD *)(a4 + 80) = v14;
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

- (MDLAnimatedVector3)animatedValue
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
