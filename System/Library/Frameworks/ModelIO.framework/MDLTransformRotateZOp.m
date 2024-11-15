@implementation MDLTransformRotateZOp

- (MDLTransformRotateZOp)initWithName:(id)a3 inverse:(BOOL)a4 data:(id)a5
{
  id v9;
  id v10;
  MDLTransformRotateZOp *v11;
  MDLTransformRotateZOp *v12;
  MDLTransformRotateZOp *v13;
  objc_super v15;

  v9 = a3;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MDLTransformRotateZOp;
  v11 = -[MDLTransformRotateZOp init](&v15, sel_init);
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
  float64x2_t v5;
  uint64_t v6;
  int v7;
  __int128 *v8;
  __int128 v9;
  __int128 v10;
  simd_float4 v11;
  float v12;
  simd_float4x4 v13;
  simd_float4 v15;
  _OWORD v16[2];
  simd_float4x4 v17;
  _OWORD v18[8];

  objc_msgSend_floatAtTime_(*(void **)(a1 + 24), a2, a3);
  memset(v18, 0, sizeof(v18));
  v5.f64[0] = 1.0;
  sub_1DCB51168((uint64_t)v18, v4 * 0.0174532925, (float64x2_t)0, 0.0, v5);
  v6 = 0;
  memset(&v17, 0, sizeof(v17));
  do
  {
    v7 = 0;
    v8 = &v18[2 * v6];
    v10 = *v8;
    v9 = v8[1];
    v11 = v17.columns[v6];
    do
    {
      v16[0] = v10;
      v16[1] = v9;
      v12 = *((double *)v16 + (v7 & 3));
      v15 = v11;
      *(float *)((unint64_t)&v15 & 0xFFFFFFFFFFFFFFF3 | (4 * (v7 & 3))) = v12;
      v11 = v15;
      ++v7;
    }
    while (v7 != 4);
    v17.columns[v6++] = v15;
  }
  while (v6 != 4);
  v13 = v17;
  if (*(_BYTE *)(a1 + 8))
    v13.columns[0].i64[0] = (unint64_t)__invert_f4(v13);
  return *(double *)v13.columns[0].i64;
}

- (double)double4x4AtTime:(uint64_t)a3@<X2>
{
  double v6;
  float64x2_t v7;
  double result;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 vars0;

  objc_msgSend_doubleAtTime_(*(void **)(a1 + 24), a2, a3);
  vars0 = 0u;
  v10 = 0u;
  v11 = 0u;
  v7.f64[0] = 1.0;
  sub_1DCB51168((uint64_t)&v10, v6 * 0.0174532925, (float64x2_t)0, 0.0, v7);
  if (*(_BYTE *)(a1 + 8))
  {
    __invert_d4();
  }
  else
  {
    a4[4] = 0u;
    a4[5] = 0u;
    a4[6] = 0u;
    a4[7] = 0u;
    v9 = v11;
    *a4 = v10;
    a4[1] = v9;
    result = *(double *)&vars0;
    a4[2] = vars0;
    a4[3] = 0u;
  }
  return result;
}

- (NSString)name
{
  return self->_name;
}

- (MDLAnimatedScalar)animatedValue
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
