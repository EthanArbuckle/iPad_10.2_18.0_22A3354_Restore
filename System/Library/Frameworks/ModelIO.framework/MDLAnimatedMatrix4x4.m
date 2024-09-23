@implementation MDLAnimatedMatrix4x4

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MDLAnimatedMatrix4x4;
  return -[MDLAnimatedValue copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (unint64_t)precision
{
  TimeSampledVtValue *begin;
  char v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  begin = self->super._timeSampledData.__begin_;
  if (self->super._timeSampledData.__end_ == begin)
    return 0;
  v5[0] = 0;
  v5[1] = 0;
  sub_1DCB25EEC(v5, (_QWORD *)begin + 1);
  if ((sub_1DCBE2EF0((pxrInternal__aapl__pxrReserved__::VtValue *)v5) & 1) != 0
    || (sub_1DCBE2EF0((pxrInternal__aapl__pxrReserved__::VtValue *)v5) & 1) != 0)
  {
    sub_1DCAEEE2C((uint64_t)v5);
    return 1;
  }
  v4 = sub_1DCBE2F28((pxrInternal__aapl__pxrReserved__::VtValue *)v5);
  sub_1DCAEEE2C((uint64_t)v5);
  if ((v4 & 1) == 0)
    return 0;
  else
    return 2;
}

- (VtValue)defaultVtValue
{
  _QWORD *v2;
  _QWORD *v3;
  TimeSampledVtValue *begin;
  _OWORD *v5;
  unsigned int *v6;
  unsigned int v7;
  _QWORD v8[3];
  VtValue result;

  v3 = v2;
  v8[2] = *MEMORY[0x1E0C80C00];
  begin = self->super._timeSampledData.__begin_;
  if (self->super._timeSampledData.__end_ == begin)
    goto LABEL_11;
  v8[0] = 0;
  v8[1] = 0;
  sub_1DCB25EEC(v8, (_QWORD *)begin + 1);
  if (sub_1DCBE2EF0((pxrInternal__aapl__pxrReserved__::VtValue *)v8)
    || sub_1DCBE2EF0((pxrInternal__aapl__pxrReserved__::VtValue *)v8))
  {
    v3[1] = (char *)&off_1EA5749C8 + 2;
    v5 = (_OWORD *)operator new();
    v5[2] = 0u;
    v5[3] = 0u;
    *v5 = 0u;
    v5[1] = 0u;
    v6 = (unsigned int *)(v5 + 4);
    goto LABEL_5;
  }
  if (!sub_1DCBE2F28((pxrInternal__aapl__pxrReserved__::VtValue *)v8))
  {
    self = (MDLAnimatedMatrix4x4 *)sub_1DCAEEE2C((uint64_t)v8);
LABEL_11:
    v3[1] = 0;
    goto LABEL_12;
  }
  v3[1] = (char *)&off_1EA574910 + 2;
  v5 = (_OWORD *)operator new();
  v5[6] = 0u;
  v5[7] = 0u;
  v5[4] = 0u;
  v5[5] = 0u;
  v5[2] = 0u;
  v5[3] = 0u;
  v6 = (unsigned int *)(v5 + 8);
  *v5 = 0u;
  v5[1] = 0u;
LABEL_5:
  atomic_store(0, v6);
  *v3 = v5;
  do
    v7 = __ldxr(v6);
  while (__stxr(v7 + 1, v6));
  self = (MDLAnimatedMatrix4x4 *)sub_1DCAEEE2C((uint64_t)v8);
LABEL_12:
  result._info._ptrAndBits = (_TypeInfo *)a2;
  result._storage = (type)self;
  return result;
}

- (void)resetWithUsdAttribute:(const void *)a3 timeScale:(double)a4
{
  TimeSampledVtValue *end;
  TimeSampledVtValue *begin;
  TimeSampledVtValue *v7;
  uint64_t v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  pxrInternal__aapl__pxrReserved__::UsdAttribute::GetTimeSamples();
  begin = self->super._timeSampledData.__begin_;
  end = self->super._timeSampledData.__end_;
  if (end != begin)
  {
    do
    {
      v7 = (TimeSampledVtValue *)((char *)end - 24);
      sub_1DCAEEE2C((uint64_t)end - 16);
      end = v7;
    }
    while (v7 != begin);
  }
  self->super._timeSampledData.__end_ = begin;
  sub_1DCBD729C((uint64_t *)&self->super._timeSampledData, 0);
  v10[0] = 0;
  v10[1] = 0;
  pxrInternal__aapl__pxrReserved__::UsdAttribute::Get();
  if ((sub_1DCBE2EF0((pxrInternal__aapl__pxrReserved__::VtValue *)v10) & 1) != 0
    || (sub_1DCBE2EF0((pxrInternal__aapl__pxrReserved__::VtValue *)v10) & 1) != 0
    || sub_1DCBE2F28((pxrInternal__aapl__pxrReserved__::VtValue *)v10))
  {
    v8 = 0;
    sub_1DCB25EEC(v9, v10);
    sub_1DCBD733C((uint64_t *)&self->super._timeSampledData, &v8);
    sub_1DCAEEE2C((uint64_t)v9);
  }
  sub_1DCAEEE2C((uint64_t)v10);
}

- (void)resetWithUsdAttribute:(const void *)a3 timeScale:(double)a4 time:(double)a5
{
  double v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v10[0] = 0;
  v10[1] = 0;
  pxrInternal__aapl__pxrReserved__::UsdAttribute::Get();
  if ((sub_1DCBE2EF0((pxrInternal__aapl__pxrReserved__::VtValue *)v10) & 1) != 0
    || (sub_1DCBE2EF0((pxrInternal__aapl__pxrReserved__::VtValue *)v10) & 1) != 0
    || sub_1DCBE2F28((pxrInternal__aapl__pxrReserved__::VtValue *)v10))
  {
    v8 = a5 * a4;
    sub_1DCB25EEC(v9, v10);
    sub_1DCBD733C((uint64_t *)&self->super._timeSampledData, &v8);
    sub_1DCAEEE2C((uint64_t)v9);
  }
  sub_1DCAEEE2C((uint64_t)v10);
}

- (void)setFloat4x4:(matrix_float4x4)value atTime:(NSTimeInterval)time
{
  matrix_float4x4 *v6;
  unsigned int *v7;
  unsigned int v8;
  TimeSampledVtValue *begin;
  const char *v10;
  uint64_t v11;
  pxrInternal__aapl__pxrReserved__::VtValue *Typeid;
  pxrInternal__aapl__pxrReserved__::VtValue *v13;
  NSTimeInterval v15;
  _QWORD v16[2];
  _BYTE v17[16];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v18[1] = (char *)&off_1EA5749C8 + 2;
  v6 = (matrix_float4x4 *)operator new();
  *v6 = value;
  v7 = (unsigned int *)&v6[1];
  atomic_store(0, (unsigned int *)&v6[1]);
  v18[0] = v6;
  do
    v8 = __ldxr(v7);
  while (__stxr(v8 + 1, v7));
  begin = self->super._timeSampledData.__begin_;
  if (self->super._timeSampledData.__end_ != begin)
  {
    v15 = 0.0;
    v16[0] = 0;
    sub_1DCB25EEC(&v15, (_QWORD *)begin + 1);
    if ((sub_1DCBE2EF0((pxrInternal__aapl__pxrReserved__::VtValue *)&v15) & 1) == 0)
    {
      objc_msgSend_defaultVtValue(self, v10, v11);
      Typeid = (pxrInternal__aapl__pxrReserved__::VtValue *)pxrInternal__aapl__pxrReserved__::VtValue::GetTypeid((pxrInternal__aapl__pxrReserved__::VtValue *)v17);
      v13 = sub_1DCBE446C((pxrInternal__aapl__pxrReserved__::VtValue *)v18, Typeid);
      sub_1DCB9AD14(v18, v13);
      sub_1DCAEEE2C((uint64_t)v17);
    }
    sub_1DCAEEE2C((uint64_t)&v15);
  }
  v15 = time;
  sub_1DCB25EEC(v16, v18);
  sub_1DCBD7754((uint64_t *)&self->super._timeSampledData, &v15);
  sub_1DCAEEE2C((uint64_t)v16);
  sub_1DCAEEE2C((uint64_t)v18);
}

- (uint64_t)setDouble4x4:(uint64_t)a3 atTime:(__int128 *)a4
{
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;
  uint64_t v9;
  pxrInternal__aapl__pxrReserved__::VtValue *v10;
  const char *v11;
  uint64_t v12;
  pxrInternal__aapl__pxrReserved__::VtValue *Typeid;
  pxrInternal__aapl__pxrReserved__::VtValue *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  double v24;
  _QWORD v25[2];
  _BYTE v26[16];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v22 = a4[3];
  v23 = a4[1];
  v18 = a4[2];
  v19 = *a4;
  v20 = a4[7];
  v21 = a4[5];
  v16 = a4[6];
  v17 = a4[4];
  v27[1] = (char *)&off_1EA574910 + 2;
  v6 = operator new();
  *(_OWORD *)v6 = v19;
  *(_OWORD *)(v6 + 16) = v23;
  *(_OWORD *)(v6 + 32) = v18;
  *(_OWORD *)(v6 + 48) = v22;
  *(_OWORD *)(v6 + 64) = v17;
  *(_OWORD *)(v6 + 80) = v21;
  *(_OWORD *)(v6 + 96) = v16;
  *(_OWORD *)(v6 + 112) = v20;
  v7 = (unsigned int *)(v6 + 128);
  atomic_store(0, (unsigned int *)(v6 + 128));
  v27[0] = v6;
  do
    v8 = __ldxr(v7);
  while (__stxr(v8 + 1, v7));
  v9 = a1[1];
  if (a1[2] != v9)
  {
    v24 = 0.0;
    v25[0] = 0;
    v10 = (pxrInternal__aapl__pxrReserved__::VtValue *)sub_1DCB25EEC(&v24, (_QWORD *)(v9 + 8));
    if ((sub_1DCBE2F28(v10) & 1) == 0)
    {
      objc_msgSend_defaultVtValue(a1, v11, v12);
      Typeid = (pxrInternal__aapl__pxrReserved__::VtValue *)pxrInternal__aapl__pxrReserved__::VtValue::GetTypeid((pxrInternal__aapl__pxrReserved__::VtValue *)v26);
      v14 = sub_1DCBE446C((pxrInternal__aapl__pxrReserved__::VtValue *)v27, Typeid);
      sub_1DCB9AD14(v27, v14);
      sub_1DCAEEE2C((uint64_t)v26);
    }
    sub_1DCAEEE2C((uint64_t)&v24);
  }
  v24 = a2;
  sub_1DCB25EEC(v25, v27);
  sub_1DCBD7754(a1 + 1, &v24);
  sub_1DCAEEE2C((uint64_t)v25);
  return sub_1DCAEEE2C((uint64_t)v27);
}

- (matrix_float4x4)float4x4AtTime:(NSTimeInterval)time
{
  std::type_info *v5;
  float32x4_t *v6;
  std::type_info *v7;
  float32x4_t *v8;
  float v9;
  simd_float4 v10;
  simd_float4 v11;
  simd_float4 v12;
  simd_float4 v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  matrix_float4x4 result;

  v24 = *MEMORY[0x1E0C80C00];
  v21 = 0.0;
  v22 = 0;
  v23 = 0;
  v18 = 0.0;
  v19 = 0;
  v20 = 0;
  sub_1DCBD8170((double **)&self->super._timeSampledData, (uint64_t)&v21, (uint64_t)&v18, time);
  if (!v23)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    goto LABEL_12;
  }
  if ((sub_1DCBE2EF0((pxrInternal__aapl__pxrReserved__::VtValue *)&v22) & 1) == 0)
  {
    v5 = sub_1DCBE39D0((pxrInternal__aapl__pxrReserved__::VtValue *)&v22);
    sub_1DCB9AD14(&v22, v5);
    if (!v23)
      goto LABEL_11;
  }
  v6 = (float32x4_t *)sub_1DCBE3A58((pxrInternal__aapl__pxrReserved__::VtValue *)&v22);
  v16 = v6[1];
  v17 = *v6;
  v14 = v6[3];
  v15 = v6[2];
  if (self->super._interpolation)
  {
    if (!v20)
      goto LABEL_11;
    if (v21 != v18)
    {
      if ((sub_1DCBE2EF0((pxrInternal__aapl__pxrReserved__::VtValue *)&v19) & 1) != 0
        || (v7 = sub_1DCBE39D0((pxrInternal__aapl__pxrReserved__::VtValue *)&v19), sub_1DCB9AD14(&v19, v7), v20))
      {
        v8 = (float32x4_t *)sub_1DCBE3A58((pxrInternal__aapl__pxrReserved__::VtValue *)&v19);
        v9 = fmax(fmin((time - v21) / (v18 - v21), 1.0), 0.0);
        v16 = vmlaq_n_f32(vmulq_n_f32(v8[1], v9), v16, 1.0 - v9);
        v17 = vmlaq_n_f32(vmulq_n_f32(*v8, v9), v17, 1.0 - v9);
        v14 = vmlaq_n_f32(vmulq_n_f32(v8[3], v9), v14, 1.0 - v9);
        v15 = vmlaq_n_f32(vmulq_n_f32(v8[2], v9), v15, 1.0 - v9);
        goto LABEL_12;
      }
LABEL_11:
      v16 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 16);
      v17 = *(float32x4_t *)MEMORY[0x1E0C83FF0];
      v14 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 48);
      v15 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 32);
    }
  }
LABEL_12:
  sub_1DCAEEE2C((uint64_t)&v19);
  sub_1DCAEEE2C((uint64_t)&v22);
  v11 = (simd_float4)v16;
  v10 = (simd_float4)v17;
  v13 = (simd_float4)v14;
  v12 = (simd_float4)v15;
  result.columns[3] = v13;
  result.columns[2] = v12;
  result.columns[1] = v11;
  result.columns[0] = v10;
  return result;
}

- (uint64_t)double4x4AtTime:(double)a3@<D0>
{
  std::type_info *v6;
  float64x2_t *v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  std::type_info *v15;
  uint64_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  double v20;
  float v21;
  double v22;
  double v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  float64x2_t *v28;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v34;
  float64x2_t v35;
  float64x2_t v36;
  float64x2_t v37;
  float64x2_t v38;
  float64x2_t v39;
  float64x2_t v40;
  float64x2_t v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v45 = 0.0;
  v46 = 0;
  v47 = 0;
  v42 = 0.0;
  v43 = 0;
  v44 = 0;
  sub_1DCBD8170((double **)(a1 + 8), (uint64_t)&v45, (uint64_t)&v42, a3);
  if (v47)
  {
    if ((sub_1DCBE2F28((pxrInternal__aapl__pxrReserved__::VtValue *)&v46) & 1) != 0
      || (v6 = sub_1DCBE3DE0((pxrInternal__aapl__pxrReserved__::VtValue *)&v46), sub_1DCB9AD14(&v46, v6), v47))
    {
      v7 = (float64x2_t *)sub_1DCBE3E68((pxrInternal__aapl__pxrReserved__::VtValue *)&v46);
      v8 = v7[1];
      v9 = v7[2];
      v10 = v7[3];
      v11 = v7[4];
      v12 = v7[5];
      v13 = v7[6];
      v14 = v7[7];
      if (!*(_QWORD *)(a1 + 32))
      {
LABEL_9:
        *a2 = *v7;
        a2[1] = v8;
        a2[2] = v9;
        a2[3] = v10;
        a2[4] = v11;
        a2[5] = v12;
        a2[6] = v13;
        a2[7] = v14;
        goto LABEL_14;
      }
      v34 = *v7;
      v35 = v7[1];
      v36 = v7[3];
      v37 = v7[2];
      v38 = v7[4];
      v39 = v7[5];
      v40 = v7[6];
      v41 = v7[7];
      if (v44)
      {
        if (v45 == v42)
          goto LABEL_9;
        if ((sub_1DCBE2F28((pxrInternal__aapl__pxrReserved__::VtValue *)&v43) & 1) != 0
          || (v15 = sub_1DCBE3DE0((pxrInternal__aapl__pxrReserved__::VtValue *)&v43), sub_1DCB9AD14(&v43, v15), v44))
        {
          v16 = sub_1DCBE3E68((pxrInternal__aapl__pxrReserved__::VtValue *)&v43);
          v17 = *(float64x2_t *)(v16 + 32);
          v18 = *(float64x2_t *)(v16 + 64);
          v19 = *(float64x2_t *)(v16 + 96);
          v20 = fmax(fmin((a3 - v45) / (v42 - v45), 1.0), 0.0);
          v21 = 1.0 - v20;
          v22 = v21;
          *(float *)&v20 = v20;
          v23 = *(float *)&v20;
          v24 = vmulq_n_f64(*(float64x2_t *)(v16 + 16), v23);
          v25 = vmulq_n_f64(*(float64x2_t *)(v16 + 48), v23);
          v26 = vmulq_n_f64(*(float64x2_t *)(v16 + 80), v23);
          v27 = vmulq_n_f64(*(float64x2_t *)(v16 + 112), v23);
          *a2 = vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)v16, v23), v34, v22);
          a2[1] = vmlaq_n_f64(v24, v35, v22);
          a2[2] = vmlaq_n_f64(vmulq_n_f64(v17, v23), v37, v22);
          a2[3] = vmlaq_n_f64(v25, v36, v22);
          a2[4] = vmlaq_n_f64(vmulq_n_f64(v18, v23), v38, v22);
          a2[5] = vmlaq_n_f64(v26, v39, v22);
          a2[6] = vmlaq_n_f64(vmulq_n_f64(v19, v23), v40, v22);
          a2[7] = vmlaq_n_f64(v27, v41, v22);
          goto LABEL_14;
        }
      }
    }
    v28 = (float64x2_t *)MEMORY[0x1E0C83FD8];
    v29 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 80);
    a2[4] = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 64);
    a2[5] = v29;
    v30 = v28[7];
    a2[6] = v28[6];
    a2[7] = v30;
    v31 = v28[1];
    *a2 = *v28;
    a2[1] = v31;
    v32 = v28[3];
    a2[2] = v28[2];
    a2[3] = v32;
    goto LABEL_14;
  }
  a2[6] = 0u;
  a2[7] = 0u;
  a2[4] = 0u;
  a2[5] = 0u;
  a2[2] = 0u;
  a2[3] = 0u;
  *a2 = 0u;
  a2[1] = 0u;
LABEL_14:
  sub_1DCAEEE2C((uint64_t)&v43);
  return sub_1DCAEEE2C((uint64_t)&v46);
}

- (void)resetWithFloat4x4Array:(const matrix_float4x4 *)valuesArray atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)count
{
  TimeSampledVtValue *end;
  uint64_t *p_timeSampledData;
  TimeSampledVtValue *begin;
  TimeSampledVtValue *v12;
  uint64_t v13;
  const matrix_float4x4 *v14;
  uint64_t v15;
  unsigned int *v16;
  unsigned int v17;
  simd_float4 v18;
  simd_float4 v19;
  simd_float4 v20;
  simd_float4 v21;
  NSTimeInterval v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  begin = self->super._timeSampledData.__begin_;
  end = self->super._timeSampledData.__end_;
  p_timeSampledData = (uint64_t *)&self->super._timeSampledData;
  if (end != begin)
  {
    do
    {
      v12 = (TimeSampledVtValue *)((char *)end - 24);
      sub_1DCAEEE2C((uint64_t)end - 16);
      end = v12;
    }
    while (v12 != begin);
  }
  self->super._timeSampledData.__end_ = begin;
  if (count)
  {
    v13 = 0;
    do
    {
      v22 = timesArray[v13];
      v14 = &valuesArray[v13];
      v23[1] = (char *)&off_1EA5749C8 + 2;
      v20 = v14->columns[1];
      v21 = v14->columns[0];
      v18 = v14->columns[3];
      v19 = v14->columns[2];
      v15 = operator new();
      *(simd_float4 *)v15 = v21;
      *(simd_float4 *)(v15 + 16) = v20;
      *(simd_float4 *)(v15 + 32) = v19;
      *(simd_float4 *)(v15 + 48) = v18;
      v16 = (unsigned int *)(v15 + 64);
      atomic_store(0, (unsigned int *)(v15 + 64));
      v23[0] = v15;
      do
        v17 = __ldxr(v16);
      while (__stxr(v17 + 1, v16));
      sub_1DCBD733C(p_timeSampledData, &v22);
      sub_1DCAEEE2C((uint64_t)v23);
      ++v13;
    }
    while (v13 != count);
  }
}

- (void)resetWithDouble4x4Array:(const matrix_double4x4 *)valuesArray atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)count
{
  TimeSampledVtValue *end;
  uint64_t *p_timeSampledData;
  TimeSampledVtValue *begin;
  TimeSampledVtValue *v12;
  uint64_t v13;
  const matrix_double4x4 *v14;
  uint64_t v15;
  unsigned int *v16;
  unsigned int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  NSTimeInterval v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  begin = self->super._timeSampledData.__begin_;
  end = self->super._timeSampledData.__end_;
  p_timeSampledData = (uint64_t *)&self->super._timeSampledData;
  if (end != begin)
  {
    do
    {
      v12 = (TimeSampledVtValue *)((char *)end - 24);
      sub_1DCAEEE2C((uint64_t)end - 16);
      end = v12;
    }
    while (v12 != begin);
  }
  self->super._timeSampledData.__end_ = begin;
  if (count)
  {
    v13 = 0;
    do
    {
      v26 = timesArray[v13];
      v14 = &valuesArray[v13];
      v24 = *(_OWORD *)&v14->columns[1].f64[2];
      v25 = *(_OWORD *)&v14->columns[0].f64[2];
      v20 = *(_OWORD *)v14->columns[1].f64;
      v21 = *(_OWORD *)v14->columns[0].f64;
      v22 = *(_OWORD *)&v14->columns[3].f64[2];
      v23 = *(_OWORD *)&v14->columns[2].f64[2];
      v18 = *(_OWORD *)v14->columns[3].f64;
      v19 = *(_OWORD *)v14->columns[2].f64;
      v27[1] = (char *)&off_1EA574910 + 2;
      v15 = operator new();
      *(_OWORD *)v15 = v21;
      *(_OWORD *)(v15 + 16) = v25;
      *(_OWORD *)(v15 + 32) = v20;
      *(_OWORD *)(v15 + 48) = v24;
      *(_OWORD *)(v15 + 64) = v19;
      *(_OWORD *)(v15 + 80) = v23;
      *(_OWORD *)(v15 + 96) = v18;
      *(_OWORD *)(v15 + 112) = v22;
      v16 = (unsigned int *)(v15 + 128);
      atomic_store(0, (unsigned int *)(v15 + 128));
      v27[0] = v15;
      do
        v17 = __ldxr(v16);
      while (__stxr(v17 + 1, v16));
      sub_1DCBD733C(p_timeSampledData, &v26);
      sub_1DCAEEE2C((uint64_t)v27);
      ++v13;
    }
    while (v13 != count);
  }
}

- (NSUInteger)getFloat4x4Array:(matrix_float4x4 *)valuesArray maxCount:(NSUInteger)maxCount
{
  unint64_t v4;
  uint64_t v6;
  simd_float4 *v7;
  unint64_t v8;
  simd_float4 *v9;
  pxrInternal__aapl__pxrReserved__::VtValue *v10;
  simd_float4 v11;
  simd_float4 v12;
  simd_float4 v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  if (0xAAAAAAAAAAAAAAABLL * ((self->super._timeSampledData.__end_ - self->super._timeSampledData.__begin_) >> 3) >= maxCount)
    v4 = maxCount;
  else
    v4 = 0xAAAAAAAAAAAAAAABLL * ((self->super._timeSampledData.__end_ - self->super._timeSampledData.__begin_) >> 3);
  if (v4)
  {
    v6 = 0;
    v7 = &valuesArray->columns[2];
    v8 = v4;
    do
    {
      v15[0] = 0;
      v15[1] = 0;
      sub_1DCB25EEC(v15, (TimeSampledVtValue *)((char *)self->super._timeSampledData.__begin_ + v6 + 8));
      if (sub_1DCBE2EF0((pxrInternal__aapl__pxrReserved__::VtValue *)v15))
      {
        v9 = (simd_float4 *)sub_1DCBE3A58((pxrInternal__aapl__pxrReserved__::VtValue *)v15);
      }
      else
      {
        v10 = (pxrInternal__aapl__pxrReserved__::VtValue *)sub_1DCBE39D0((pxrInternal__aapl__pxrReserved__::VtValue *)v15);
        v9 = (simd_float4 *)sub_1DCBE3A58(v10);
      }
      v11 = v9[1];
      v12 = v9[2];
      v13 = v9[3];
      v7[-2] = *v9;
      v7[-1] = v11;
      *v7 = v12;
      v7[1] = v13;
      v7 += 4;
      sub_1DCAEEE2C((uint64_t)v15);
      v6 += 24;
      --v8;
    }
    while (v8);
  }
  return v4;
}

- (NSUInteger)getDouble4x4Array:(matrix_double4x4 *)valuesArray maxCount:(NSUInteger)maxCount
{
  unint64_t v4;
  uint64_t v6;
  simd_double4 *v7;
  unint64_t v8;
  _OWORD *v9;
  pxrInternal__aapl__pxrReserved__::VtValue *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  if (0xAAAAAAAAAAAAAAABLL * ((self->super._timeSampledData.__end_ - self->super._timeSampledData.__begin_) >> 3) >= maxCount)
    v4 = maxCount;
  else
    v4 = 0xAAAAAAAAAAAAAAABLL * ((self->super._timeSampledData.__end_ - self->super._timeSampledData.__begin_) >> 3);
  if (v4)
  {
    v6 = 0;
    v7 = &valuesArray->columns[2];
    v8 = v4;
    do
    {
      v19[0] = 0;
      v19[1] = 0;
      sub_1DCB25EEC(v19, (TimeSampledVtValue *)((char *)self->super._timeSampledData.__begin_ + v6 + 8));
      if (sub_1DCBE2F28((pxrInternal__aapl__pxrReserved__::VtValue *)v19))
      {
        v9 = (_OWORD *)sub_1DCBE3E68((pxrInternal__aapl__pxrReserved__::VtValue *)v19);
      }
      else
      {
        v10 = (pxrInternal__aapl__pxrReserved__::VtValue *)sub_1DCBE3DE0((pxrInternal__aapl__pxrReserved__::VtValue *)v19);
        v9 = (_OWORD *)sub_1DCBE3E68(v10);
      }
      v11 = v9[1];
      v12 = v9[2];
      v13 = v9[3];
      v14 = v9[4];
      v15 = v9[5];
      v16 = v9[6];
      v17 = v9[7];
      *(_OWORD *)v7[-2].f64 = *v9;
      *(_OWORD *)&v7[-2].f64[2] = v11;
      *(_OWORD *)v7[-1].f64 = v12;
      *(_OWORD *)&v7[-1].f64[2] = v13;
      *(_OWORD *)v7->f64 = v14;
      *(_OWORD *)&v7->f64[2] = v15;
      *(_OWORD *)v7[1].f64 = v16;
      *(_OWORD *)&v7[1].f64[2] = v17;
      sub_1DCAEEE2C((uint64_t)v19);
      v7 += 4;
      v6 += 24;
      --v8;
    }
    while (v8);
  }
  return v4;
}

@end
