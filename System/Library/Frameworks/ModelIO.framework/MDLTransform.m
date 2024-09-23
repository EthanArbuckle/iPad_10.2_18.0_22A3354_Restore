@implementation MDLTransform

- (void).cxx_destruct
{
  void *begin;
  void *v4;
  void *v5;
  void *v6;

  begin = self->_transform._keyedScale.__begin_;
  if (begin)
  {
    self->_transform._keyedScale.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_transform._keyedShear.__begin_;
  if (v4)
  {
    self->_transform._keyedShear.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_transform._keyedRotation.__begin_;
  if (v5)
  {
    self->_transform._keyedRotation.__end_ = v5;
    operator delete(v5);
  }
  v6 = self->_transform._keyedTranslation.__begin_;
  if (v6)
  {
    self->_transform._keyedTranslation.__end_ = v6;
    operator delete(v6);
  }
}

- (MDLTransform)init
{
  id v2;
  MDLTransform *v3;
  MDLTransform *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MDLTransform;
  v2 = -[MDLTransform init](&v6, sel_init);
  v3 = (MDLTransform *)v2;
  if (v2)
  {
    sub_1DCAD3ADC((char **)v2 + 2);
    v4 = v3;
  }

  return v3;
}

- (id).cxx_construct
{
  *((_BYTE *)self + 129) = 0;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 12) = 0u;
  *((_OWORD *)self + 13) = 0u;
  *((_OWORD *)self + 14) = 0u;
  *((_OWORD *)self + 15) = 0u;
  *((_OWORD *)self + 16) = 0u;
  *((_OWORD *)self + 17) = 0u;
  *((_OWORD *)self + 18) = 0u;
  *((_OWORD *)self + 19) = 0u;
  *((_OWORD *)self + 20) = 0u;
  *((_OWORD *)self + 21) = 0u;
  *((_OWORD *)self + 22) = 0u;
  *((_OWORD *)self + 23) = 0u;
  *((_OWORD *)self + 24) = 0u;
  return self;
}

- (__n128)matrix
{
  return a1[9];
}

- (NSArray)keyTimes
{
  id v3;
  const char *v4;
  uint64_t v5;
  double *v6;
  double *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *__p;
  double *v14;
  uint64_t v15;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  __p = 0;
  v14 = 0;
  v15 = 0;
  sub_1DCB489A0((__int128 **)&self->_transform, (uint64_t)&__p);
  v7 = (double *)__p;
  v6 = v14;
  if (v14 == __p)
  {
    objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v4, v5, 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v11, (uint64_t)v10);

  }
  else
  {
    do
    {
      objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v4, v5, *v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v3, v9, (uint64_t)v8);

      ++v7;
    }
    while (v7 != v6);
  }
  if (__p)
  {
    v14 = (double *)__p;
    operator delete(__p);
  }
  return (NSArray *)v3;
}

- (double)minimumTime
{
  double result;

  result = self->_transform._startTime;
  if (result == 1.79769313e308)
    return 0.0;
  return result;
}

- (double)maximumTime
{
  double result;

  result = self->_transform._greatestTime;
  if (result == 1.79769313e308)
    return 0.0;
  return result;
}

- (double)setMatrix:(__n128)a3
{
  double result;
  _OWORD v6[4];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  v6[3] = a5;
  *(_QWORD *)&result = sub_1DCB47EA4(a1 + 16, v6).n128_u64[0];
  return result;
}

- (vector_float3)translation
{
  vector_float3 result;

  result.i64[1] = (uint64_t)a2;
  result.i64[0] = (uint64_t)self;
  return result;
}

- (void)setTranslation:(vector_float3)translation
{
  __n128 v3;

  sub_1DCBC1264((__n128 **)&self->_transform, v3);
}

- (vector_float3)shear
{
  vector_float3 result;

  result.i64[1] = (uint64_t)a2;
  result.i64[0] = (uint64_t)self;
  return result;
}

- (void)setShear:(vector_float3)shear
{
  __n128 v3;

  sub_1DCC1B57C(&self->_transform._keyedTranslation.__begin_, v3);
}

- (vector_float3)scale
{
  vector_float3 result;

  if (self->_transform._keyedScale.__end_ == self->_transform._keyedScale.__begin_)
    __asm { FMOV            V0.4S, #1.0 }
  result.i64[1] = (uint64_t)a2;
  result.i64[0] = (uint64_t)self;
  return result;
}

- (void)setScale:(vector_float3)scale
{
  __n128 v3;

  sub_1DCC1B670(&self->_transform._keyedTranslation.__begin_, v3);
}

- (vector_float3)rotation
{
  vector_float3 result;

  result.i64[1] = (uint64_t)a2;
  result.i64[0] = (uint64_t)self;
  return result;
}

- (BOOL)resetsTransform
{
  return self->_transform._resetTransformStack;
}

- (void)setRotation:(vector_float3)rotation
{
  __n128 v3;

  sub_1DCC1B76C(&self->_transform._keyedTranslation.__begin_, v3);
}

- (vector_float3)scaleAtTime:(NSTimeInterval)time
{
  uint64_t v3;
  uint64_t v4;
  vector_float3 result;

  sub_1DCB47ACC((uint64_t)&self->_transform, time);
  result.i64[1] = v4;
  result.i64[0] = v3;
  return result;
}

- (vector_float3)shearAtTime:(NSTimeInterval)time
{
  uint64_t v3;
  uint64_t v4;
  vector_float3 result;

  sub_1DCB47A04((uint64_t)&self->_transform, time);
  result.i64[1] = v4;
  result.i64[0] = v3;
  return result;
}

- (vector_float3)translationAtTime:(NSTimeInterval)time
{
  uint64_t v3;
  uint64_t v4;
  vector_float3 result;

  sub_1DCB4793C((float32x4_t **)&self->_transform, time);
  result.i64[1] = v4;
  result.i64[0] = v3;
  return result;
}

- (vector_float3)rotationAtTime:(NSTimeInterval)time
{
  uint64_t v3;
  uint64_t v4;
  vector_float3 result;

  sub_1DCB476B4((uint64_t)&self->_transform, time);
  result.i64[1] = v4;
  result.i64[0] = v3;
  return result;
}

- (void)setMatrix:(matrix_float4x4)matrix forTime:(NSTimeInterval)time
{
  matrix_float4x4 v4;

  v4 = matrix;
  sub_1DCB4820C((uint64_t)&self->_transform, &v4, time);
}

- (void)setRotation:(vector_float3)rotation forTime:(NSTimeInterval)time
{
  double v4;

  sub_1DCB484D8((uint64_t)&self->_transform, *(__n128 *)&time, v4);
}

- (void)setShear:(vector_float3)shear forTime:(NSTimeInterval)time
{
  double v4;

  sub_1DCB48670((uint64_t)&self->_transform, *(__n128 *)&time, v4);
}

- (void)setScale:(vector_float3)scale forTime:(NSTimeInterval)time
{
  double v4;

  sub_1DCB48808((uint64_t)&self->_transform, *(__n128 *)&time, v4);
}

- (void)setTranslation:(vector_float3)translation forTime:(NSTimeInterval)time
{
  double v4;

  sub_1DCB4834C((uint64_t)&self->_transform, *(__n128 *)&time, v4);
}

- (void)setResetsTransform:(BOOL)a3
{
  self->_transform._resetTransformStack = a3;
}

- (void)setIdentity
{
  sub_1DCAD3ADC((char **)&self->_transform);
}

- (MDLTransform)initWithTransformComponent:(id)component
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  MDLTransform *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  MDLTransform *v14;
  _OWORD v16[4];

  v4 = component;
  v9 = (MDLTransform *)objc_msgSend_init(self, v5, v6);
  if (v9)
  {
    objc_msgSend_localTransformAtTime_(v4, v7, v8, 0.0);
    v16[0] = v10;
    v16[1] = v11;
    v16[2] = v12;
    v16[3] = v13;
    sub_1DCB47EA4((uint64_t)&v9->_transform, v16);
    v14 = v9;
  }

  return v9;
}

- (MDLTransform)initWithTransformComponent:(id)component resetsTransform:(BOOL)resetsTransform
{
  MDLTransform *v5;
  MDLTransform *v6;
  MDLTransform *v7;

  v5 = (MDLTransform *)objc_msgSend_initWithTransformComponent_(self, a2, (uint64_t)component);
  v6 = v5;
  if (v5)
  {
    v5->_transform._resetTransformStack = resetsTransform;
    v7 = v5;
  }

  return v6;
}

- (MDLTransform)initWithMatrix:(matrix_float4x4)matrix
{
  uint64_t v3;
  uint64_t v4;
  MDLTransform *v5;
  MDLTransform *v6;
  __int128 v8;

  v4 = objc_msgSend_init(self, a2, v3, *(_OWORD *)matrix.columns, matrix.columns[1].i64[0], matrix.columns[1].i64[1], matrix.columns[2].i64[0], matrix.columns[2].i64[1], matrix.columns[3].i64[0], matrix.columns[3].i64[1]);
  v5 = (MDLTransform *)v4;
  if (v4)
  {
    sub_1DCB47EA4(v4 + 16, &v8);
    v6 = v5;
  }

  return v5;
}

- (MDLTransform)initWithMatrix:(matrix_float4x4)matrix resetsTransform:(BOOL)resetsTransform
{
  uint64_t v5;
  MDLTransform *v6;
  MDLTransform *v7;
  __int128 v9;

  v5 = objc_msgSend_init(self, a2, resetsTransform, *(_OWORD *)matrix.columns, matrix.columns[1].i64[0], matrix.columns[1].i64[1], matrix.columns[2].i64[0], matrix.columns[2].i64[1], matrix.columns[3].i64[0], matrix.columns[3].i64[1]);
  v6 = (MDLTransform *)v5;
  if (v5)
  {
    *(_BYTE *)(v5 + 129) = resetsTransform;
    sub_1DCB47EA4(v5 + 16, &v9);
    v7 = v6;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (void *)objc_msgSend_init(v7, v8, v9);
  sub_1DCBC1FF8((uint64_t)v10 + 16, (uint64_t)&self->_transform);
  return v10;
}

- (void)setLocalTransform:(__n128)a3 forTime:(__n128)a4
{
  _OWORD v6[4];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  v6[3] = a5;
  sub_1DCB4820C(a1 + 16, v6, a6);
}

- (double)setLocalTransform:(__n128)a3
{
  double result;
  _OWORD v6[4];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  v6[3] = a5;
  *(_QWORD *)&result = sub_1DCB47EA4(a1 + 16, v6).n128_u64[0];
  return result;
}

- (__n128)localTransformAtTime:(__n128 *)a1
{
  sub_1DCB47BA0((uint64_t)&a1[1], a2);
  return a1[9];
}

- (matrix_float4x4)rotationMatrixAtTime:(NSTimeInterval)time
{
  simd_float4 v3;
  simd_float4 v4;
  simd_float4 v5;
  simd_float4 v6;
  matrix_float4x4 result;

  v3 = *(simd_float4 *)&self[1]._transform._identity;
  v4 = *(simd_float4 *)&self[2].super.isa;
  v5 = *(simd_float4 *)&self[2]._transform._keyedTranslation.__begin_;
  v6 = *(simd_float4 *)&self[2]._transform._keyedTranslation.__end_cap_.__value_;
  result.columns[3] = v6;
  result.columns[2] = v5;
  result.columns[1] = v4;
  result.columns[0] = v3;
  return result;
}

+ (__n128)localTransformWithObject:(const char *)a3 atTime:(void *)a4
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v11;

  objc_msgSend_componentConformingToProtocol_(a4, a3, (uint64_t)&unk_1F03B9AF8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  if (v5)
  {
    objc_msgSend_localTransformAtTime_(v5, v6, v7, a1);
    v11 = v9;
  }
  else
  {
    v11 = *MEMORY[0x1E0C83FF0];
  }

  return (__n128)v11;
}

+ (__n128)globalTransformWithObject:(uint64_t)a3 atTime:(void *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  const char *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  __int128 v33;
  _OWORD v34[4];
  _OWORD v35[4];

  v5 = a4;
  objc_msgSend_parent(v5, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    do
    {
      objc_msgSend_componentConformingToProtocol_(v9, v8, (uint64_t)&unk_1F03B9AF8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        break;
      objc_msgSend_parent(v9, v8, v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v12;
    }
    while (v12);
  }
  objc_msgSend_componentConformingToProtocol_(v9, v8, (uint64_t)&unk_1F03B9AF8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_resetsTransform(v13, v14, v15) || !v13)
  {
    objc_msgSend_localTransformWithObject_atTime_(MDLTransform, v16, (uint64_t)v5, a1);
    v33 = v27;
  }
  else
  {
    objc_msgSend_globalTransformWithObject_atTime_(MDLTransform, v16, (uint64_t)v9, a1);
    v31 = v18;
    v32 = v17;
    v29 = v20;
    v30 = v19;
    objc_msgSend_localTransformWithObject_atTime_(MDLTransform, v21, (uint64_t)v5, a1);
    v22 = 0;
    v34[0] = v23;
    v34[1] = v24;
    v34[2] = v25;
    v34[3] = v26;
    memset(v35, 0, sizeof(v35));
    do
    {
      v35[v22] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v32, COERCE_FLOAT(v34[v22])), v31, *(float32x2_t *)&v34[v22], 1), v30, (float32x4_t)v34[v22], 2), v29, (float32x4_t)v34[v22], 3);
      ++v22;
    }
    while (v22 != 4);
    v33 = v35[0];
  }

  return (__n128)v33;
}

- (CAAnimation)transformAnimation
{
  const char *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  const char *v24;
  void *v25;
  const char *v26;
  const char *v27;
  void *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  double v38;
  const char *v39;
  uint64_t v40;
  _OWORD v42[8];
  void *__p;
  void *v44;
  uint64_t v45;

  __p = 0;
  v44 = 0;
  v45 = 0;
  sub_1DCB489A0((__int128 **)&self->_transform, (uint64_t)&__p);
  v4 = v44;
  v5 = (_BYTE *)v44 - (_BYTE *)__p;
  if (v44 == __p)
  {
    v28 = 0;
    if (!v44)
      return (CAAnimation *)v28;
    goto LABEL_7;
  }
  v6 = v5 >> 3;
  objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v3, v5 >> 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v8, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = *(double *)__p;
  v14 = *((double *)v44 - 1) - *(double *)__p;
  if (v6 <= 1)
    v15 = 1;
  else
    v15 = v6;
  do
  {
    v16 = *((double *)__p + v12);
    objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v9, v10, (v16 - v13) * (1.0 / v14));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localTransformAtTime_(self, v18, v19, v16);
    v42[0] = vcvtq_f64_f32(*(float32x2_t *)v20.f32);
    v42[1] = vcvt_hight_f64_f32(v20);
    v42[2] = vcvtq_f64_f32(*(float32x2_t *)v21.f32);
    v42[3] = vcvt_hight_f64_f32(v21);
    v42[4] = vcvtq_f64_f32(*(float32x2_t *)v22.f32);
    v42[5] = vcvt_hight_f64_f32(v22);
    v42[6] = vcvtq_f64_f32(*(float32x2_t *)v23.f32);
    v42[7] = vcvt_hight_f64_f32(v23);
    objc_msgSend_valueWithCATransform3D_(MEMORY[0x1E0CB3B18], v24, (uint64_t)v42);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v7, v26, (uint64_t)v17);
    objc_msgSend_addObject_(v11, v27, (uint64_t)v25);

    ++v12;
  }
  while (v15 != v12);
  objc_msgSend_animation(MEMORY[0x1E0CD2798], v9, v10);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setKeyPath_(v28, v29, (uint64_t)CFSTR("transform"));
  objc_msgSend_setValues_(v28, v30, (uint64_t)v11);
  objc_msgSend_setKeyTimes_(v28, v31, (uint64_t)v7);
  objc_msgSend_setBeginTime_(v28, v32, v33, v13);
  objc_msgSend_setDuration_(v28, v34, v35, v14);
  objc_msgSend_setAdditive_(v28, v36, 0);
  objc_msgSend_setRemovedOnCompletion_(v28, v37, 0);
  LODWORD(v38) = 2139095039;
  objc_msgSend_setRepeatCount_(v28, v39, v40, v38);

  v4 = __p;
  if (__p)
  {
LABEL_7:
    v44 = v4;
    operator delete(v4);
  }
  return (CAAnimation *)v28;
}

@end
