@implementation MDLTransformTranslateOp

- (MDLTransformTranslateOp)initWithName:(id)a3 inverse:(BOOL)a4 data:(id)a5
{
  id v9;
  id v10;
  MDLTransformTranslateOp *v11;
  MDLTransformTranslateOp *v12;
  MDLTransformTranslateOp *v13;
  objc_super v15;

  v9 = a3;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MDLTransformTranslateOp;
  v11 = -[MDLTransformTranslateOp init](&v15, sel_init);
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
  v4.columns[0] = (simd_float4)*MEMORY[0x1E0C83FF0];
  v4.columns[3].i32[3] = 1.0;
  if (*(_BYTE *)(a1 + 8))
  {
    v4.columns[1] = *(simd_float4 *)(MEMORY[0x1E0C83FF0] + 16);
    v4.columns[2] = *(simd_float4 *)(MEMORY[0x1E0C83FF0] + 32);
    v4.columns[0].i64[0] = (unint64_t)__invert_f4(v4);
  }
  return *(double *)v4.columns[0].i64;
}

- (void)double4x4AtTime:(uint64_t)a3@<X2>
{
  void *result;
  int8x16_t v7;
  unint64_t v8;
  __int128 v9;
  _OWORD *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  int8x16_t v14;
  uint64_t vars0;

  result = *(void **)(a1 + 24);
  if (result)
  {
    result = (void *)objc_msgSend_double3AtTime_(result, a2, a3);
    v7 = v14;
    v8 = vextq_s8(v7, v7, 8uLL).u64[0];
    *(_QWORD *)&v9 = vars0;
  }
  else
  {
    v7.i64[0] = 0;
    v8 = 0;
    *(_QWORD *)&v9 = 0;
  }
  v7.i64[1] = v8;
  *((_QWORD *)&v9 + 1) = 1.0;
  if (*(_BYTE *)(a1 + 8))
    return (void *)__invert_d4();
  v10 = (_OWORD *)MEMORY[0x1E0C83FD8];
  v11 = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 48);
  a4[2] = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 32);
  a4[3] = v11;
  v12 = v10[5];
  a4[4] = v10[4];
  a4[5] = v12;
  v13 = v10[1];
  *a4 = *v10;
  a4[1] = v13;
  a4[6] = v7;
  a4[7] = v9;
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
