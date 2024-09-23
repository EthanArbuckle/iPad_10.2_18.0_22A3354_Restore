@implementation MDLAnimatedVector4

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MDLAnimatedVector4;
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
  if ((sub_1DCB8CEA8((pxrInternal__aapl__pxrReserved__::VtValue *)v5) & 1) != 0
    || (sub_1DCBE06AC((pxrInternal__aapl__pxrReserved__::VtValue *)v5) & 1) != 0)
  {
    sub_1DCAEEE2C((uint64_t)v5);
    return 1;
  }
  v4 = sub_1DCBE06E4((pxrInternal__aapl__pxrReserved__::VtValue *)v5);
  sub_1DCAEEE2C((uint64_t)v5);
  if ((v4 & 1) == 0)
    return 0;
  else
    return 2;
}

- (VtValue)defaultVtValue
{
  uint64_t *v2;
  uint64_t *v3;
  TimeSampledVtValue *begin;
  uint64_t v5;
  unsigned int *v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int *v9;
  unsigned int v10;
  _QWORD v11[3];
  VtValue result;

  v3 = v2;
  v11[2] = *MEMORY[0x1E0C80C00];
  begin = self->super._timeSampledData.__begin_;
  if (self->super._timeSampledData.__end_ == begin)
    goto LABEL_13;
  v11[0] = 0;
  v11[1] = 0;
  sub_1DCB25EEC(v11, (_QWORD *)begin + 1);
  if (!sub_1DCBE06AC((pxrInternal__aapl__pxrReserved__::VtValue *)v11))
  {
    if (sub_1DCB8CEA8((pxrInternal__aapl__pxrReserved__::VtValue *)v11))
    {
      v3[1] = (uint64_t)&off_1EA575268 + 2;
      v5 = operator new();
      *(_QWORD *)v5 = 0;
      *(_QWORD *)(v5 + 8) = 0;
      v6 = (unsigned int *)(v5 + 16);
      atomic_store(0, (unsigned int *)(v5 + 16));
      *v3 = v5;
      do
        v7 = __ldxr(v6);
      while (__stxr(v7 + 1, v6));
      goto LABEL_11;
    }
    if (sub_1DCBE06E4((pxrInternal__aapl__pxrReserved__::VtValue *)v11))
    {
      v3[1] = (uint64_t)&off_1EA5751B0 + 2;
      v8 = operator new();
      *(_OWORD *)v8 = 0u;
      *(_OWORD *)(v8 + 16) = 0u;
      v9 = (unsigned int *)(v8 + 32);
      atomic_store(0, (unsigned int *)(v8 + 32));
      *v3 = v8;
      do
        v10 = __ldxr(v9);
      while (__stxr(v10 + 1, v9));
      goto LABEL_11;
    }
    self = (MDLAnimatedVector4 *)sub_1DCAEEE2C((uint64_t)v11);
LABEL_13:
    v3[1] = 0;
    goto LABEL_14;
  }
  *v3 = 0;
  v3[1] = (uint64_t)&off_1EA575320 + 3;
LABEL_11:
  self = (MDLAnimatedVector4 *)sub_1DCAEEE2C((uint64_t)v11);
LABEL_14:
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
  if ((sub_1DCBE06AC((pxrInternal__aapl__pxrReserved__::VtValue *)v10) & 1) != 0
    || (sub_1DCB8CEA8((pxrInternal__aapl__pxrReserved__::VtValue *)v10) & 1) != 0
    || sub_1DCBE06E4((pxrInternal__aapl__pxrReserved__::VtValue *)v10))
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
  if ((sub_1DCBE06AC((pxrInternal__aapl__pxrReserved__::VtValue *)v10) & 1) != 0
    || (sub_1DCB8CEA8((pxrInternal__aapl__pxrReserved__::VtValue *)v10) & 1) != 0
    || sub_1DCBE06E4((pxrInternal__aapl__pxrReserved__::VtValue *)v10))
  {
    v8 = a5 * a4;
    sub_1DCB25EEC(v9, v10);
    sub_1DCBD733C((uint64_t *)&self->super._timeSampledData, &v8);
    sub_1DCAEEE2C((uint64_t)v9);
  }
  sub_1DCAEEE2C((uint64_t)v10);
}

- (void)setFloat4:(vector_float4)value atTime:(NSTimeInterval)time
{
  vector_float4 *v6;
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
  v18[1] = (char *)&off_1EA575268 + 2;
  v6 = (vector_float4 *)operator new();
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
    if ((sub_1DCB8CEA8((pxrInternal__aapl__pxrReserved__::VtValue *)&v15) & 1) == 0)
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

- (uint64_t)setDouble4:(uint64_t)a3 atTime:(__int128 *)a4
{
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  pxrInternal__aapl__pxrReserved__::VtValue *Typeid;
  pxrInternal__aapl__pxrReserved__::VtValue *v13;
  __int128 v15;
  __int128 v16;
  double v17;
  _QWORD v18[2];
  _BYTE v19[16];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v15 = *a4;
  v16 = a4[1];
  v20[1] = (char *)&off_1EA5751B0 + 2;
  v6 = operator new();
  *(_OWORD *)v6 = v15;
  *(_OWORD *)(v6 + 16) = v16;
  v7 = (unsigned int *)(v6 + 32);
  atomic_store(0, (unsigned int *)(v6 + 32));
  v20[0] = v6;
  do
    v8 = __ldxr(v7);
  while (__stxr(v8 + 1, v7));
  v9 = a1[1];
  if (a1[2] != v9)
  {
    v17 = 0.0;
    v18[0] = 0;
    sub_1DCB25EEC(&v17, (_QWORD *)(v9 + 8));
    if ((sub_1DCBE06E4((pxrInternal__aapl__pxrReserved__::VtValue *)&v17) & 1) == 0)
    {
      objc_msgSend_defaultVtValue(a1, v10, v11);
      Typeid = (pxrInternal__aapl__pxrReserved__::VtValue *)pxrInternal__aapl__pxrReserved__::VtValue::GetTypeid((pxrInternal__aapl__pxrReserved__::VtValue *)v19);
      v13 = sub_1DCBE446C((pxrInternal__aapl__pxrReserved__::VtValue *)v20, Typeid);
      sub_1DCB9AD14(v20, v13);
      sub_1DCAEEE2C((uint64_t)v19);
    }
    sub_1DCAEEE2C((uint64_t)&v17);
  }
  v17 = a2;
  sub_1DCB25EEC(v18, v20);
  sub_1DCBD7754(a1 + 1, &v17);
  sub_1DCAEEE2C((uint64_t)v18);
  return sub_1DCAEEE2C((uint64_t)v20);
}

- (vector_float4)float4AtTime:(NSTimeInterval)time
{
  std::type_info *v5;
  float32x4_t *v6;
  float32x4_t v7;
  std::type_info *v8;
  float32x4_t *v9;
  float v10;
  float32x4_t v12;
  vector_float4 v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v17 = 0.0;
  v18 = 0;
  v19 = 0;
  v14 = 0.0;
  v15 = 0;
  v16 = 0;
  sub_1DCBD8170((double **)&self->super._timeSampledData, (uint64_t)&v17, (uint64_t)&v14, time);
  v13 = 0u;
  if (v19)
  {
    if ((sub_1DCB8CEA8((pxrInternal__aapl__pxrReserved__::VtValue *)&v18) & 1) != 0
      || (v5 = sub_1DCBE10B4((pxrInternal__aapl__pxrReserved__::VtValue *)&v18), sub_1DCB9AD14(&v18, v5), v19))
    {
      v6 = (float32x4_t *)sub_1DCB8D030((pxrInternal__aapl__pxrReserved__::VtValue *)&v18);
      v7 = *v6;
      if (!self->super._interpolation)
      {
LABEL_11:
        v13 = (vector_float4)v7;
        goto LABEL_12;
      }
      v12 = *v6;
      if (v16)
      {
        if (v17 == v14)
        {
          v7 = *v6;
          goto LABEL_11;
        }
        if ((sub_1DCB8CEA8((pxrInternal__aapl__pxrReserved__::VtValue *)&v15) & 1) != 0
          || (v8 = sub_1DCBE10B4((pxrInternal__aapl__pxrReserved__::VtValue *)&v15), sub_1DCB9AD14(&v15, v8), v16))
        {
          v9 = (float32x4_t *)sub_1DCB8D030((pxrInternal__aapl__pxrReserved__::VtValue *)&v15);
          v10 = fmax(fmin((time - v17) / (v14 - v17), 1.0), 0.0);
          v7 = vmlaq_n_f32(vmulq_n_f32(*v9, v10), v12, 1.0 - v10);
          goto LABEL_11;
        }
      }
    }
  }
LABEL_12:
  sub_1DCAEEE2C((uint64_t)&v15);
  sub_1DCAEEE2C((uint64_t)&v18);
  return v13;
}

- (uint64_t)double4AtTime:(double)a3@<D0>
{
  std::type_info *v6;
  float64x2_t *v7;
  float64x2_t v8;
  float64x2_t v9;
  std::type_info *v10;
  float64x2_t *v11;
  double v12;
  float64x2_t v14;
  float64x2_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v19 = 0.0;
  v20 = 0;
  v21 = 0;
  v16 = 0.0;
  v17 = 0;
  v18 = 0;
  sub_1DCBD8170((double **)(a1 + 8), (uint64_t)&v19, (uint64_t)&v16, a3);
  if (!v21)
    goto LABEL_12;
  if ((sub_1DCBE06E4((pxrInternal__aapl__pxrReserved__::VtValue *)&v20) & 1) == 0)
  {
    v6 = sub_1DCBE1320((pxrInternal__aapl__pxrReserved__::VtValue *)&v20);
    sub_1DCB9AD14(&v20, v6);
    if (!v21)
      goto LABEL_12;
  }
  v7 = (float64x2_t *)sub_1DCBE13A8((pxrInternal__aapl__pxrReserved__::VtValue *)&v20);
  v8 = *v7;
  v15 = *v7;
  v9 = v7[1];
  if (!*(_QWORD *)(a1 + 32))
    goto LABEL_13;
  if (!v18)
    goto LABEL_12;
  v14 = v7[1];
  if (v19 != v16)
  {
    if ((sub_1DCBE06E4((pxrInternal__aapl__pxrReserved__::VtValue *)&v17) & 1) != 0
      || (v10 = sub_1DCBE1320((pxrInternal__aapl__pxrReserved__::VtValue *)&v17), sub_1DCB9AD14(&v17, v10), v18))
    {
      v11 = (float64x2_t *)sub_1DCBE13A8((pxrInternal__aapl__pxrReserved__::VtValue *)&v17);
      v12 = fmax(fmin((a3 - v19) / (v16 - v19), 1.0), 0.0);
      v9 = vmlaq_n_f64(vmulq_n_f64(v11[1], v12), v14, 1.0 - v12);
      v8 = vmlaq_n_f64(vmulq_n_f64(*v11, v12), v15, 1.0 - v12);
      goto LABEL_13;
    }
LABEL_12:
    v8 = 0uLL;
    v9 = 0uLL;
    goto LABEL_13;
  }
  v9 = v7[1];
LABEL_13:
  *a2 = v8;
  a2[1] = v9;
  sub_1DCAEEE2C((uint64_t)&v17);
  return sub_1DCAEEE2C((uint64_t)&v20);
}

- (void)resetWithFloat4Array:(const vector_float4 *)valuesArray atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)count
{
  TimeSampledVtValue *end;
  uint64_t *p_timeSampledData;
  TimeSampledVtValue *begin;
  TimeSampledVtValue *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int *v15;
  unsigned int v16;
  vector_float4 v17;
  NSTimeInterval v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
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
      v18 = timesArray[v13];
      v19[1] = (char *)&off_1EA575268 + 2;
      v17 = valuesArray[v13];
      v14 = operator new();
      *(vector_float4 *)v14 = v17;
      v15 = (unsigned int *)(v14 + 16);
      atomic_store(0, (unsigned int *)(v14 + 16));
      v19[0] = v14;
      do
        v16 = __ldxr(v15);
      while (__stxr(v16 + 1, v15));
      sub_1DCBD733C(p_timeSampledData, &v18);
      sub_1DCAEEE2C((uint64_t)v19);
      ++v13;
    }
    while (v13 != count);
  }
}

- (void)resetWithDouble4Array:(const vector_double4 *)valuesArray atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)count
{
  TimeSampledVtValue *end;
  uint64_t *p_timeSampledData;
  TimeSampledVtValue *begin;
  TimeSampledVtValue *v12;
  uint64_t v13;
  const vector_double4 *v14;
  uint64_t v15;
  unsigned int *v16;
  unsigned int v17;
  __int128 v18;
  __int128 v19;
  NSTimeInterval v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
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
      v20 = timesArray[v13];
      v14 = &valuesArray[v13];
      v18 = *(_OWORD *)v14->f64;
      v19 = *(_OWORD *)&v14->f64[2];
      v21[1] = (char *)&off_1EA5751B0 + 2;
      v15 = operator new();
      *(_OWORD *)v15 = v18;
      *(_OWORD *)(v15 + 16) = v19;
      v16 = (unsigned int *)(v15 + 32);
      atomic_store(0, (unsigned int *)(v15 + 32));
      v21[0] = v15;
      do
        v17 = __ldxr(v16);
      while (__stxr(v17 + 1, v16));
      sub_1DCBD733C(p_timeSampledData, &v20);
      sub_1DCAEEE2C((uint64_t)v21);
      ++v13;
    }
    while (v13 != count);
  }
}

- (NSUInteger)getFloat4Array:(vector_float4 *)valuesArray maxCount:(NSUInteger)maxCount
{
  unint64_t v4;
  uint64_t v7;
  unint64_t v8;
  char v9;
  pxrInternal__aapl__pxrReserved__::VtValue *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  if (0xAAAAAAAAAAAAAAABLL * ((self->super._timeSampledData.__end_ - self->super._timeSampledData.__begin_) >> 3) >= maxCount)
    v4 = maxCount;
  else
    v4 = 0xAAAAAAAAAAAAAAABLL * ((self->super._timeSampledData.__end_ - self->super._timeSampledData.__begin_) >> 3);
  if (v4)
  {
    v7 = 0;
    v8 = v4;
    do
    {
      v12[0] = 0;
      v12[1] = 0;
      sub_1DCB25EEC(v12, (TimeSampledVtValue *)((char *)self->super._timeSampledData.__begin_ + v7 + 8));
      v9 = sub_1DCB8CEA8((pxrInternal__aapl__pxrReserved__::VtValue *)v12);
      v10 = (pxrInternal__aapl__pxrReserved__::VtValue *)v12;
      if ((v9 & 1) == 0)
        v10 = (pxrInternal__aapl__pxrReserved__::VtValue *)sub_1DCBE10B4((pxrInternal__aapl__pxrReserved__::VtValue *)v12);
      *valuesArray++ = *(vector_float4 *)sub_1DCB8D030(v10);
      sub_1DCAEEE2C((uint64_t)v12);
      v7 += 24;
      --v8;
    }
    while (v8);
  }
  return v4;
}

- (NSUInteger)getDouble4Array:(vector_double4 *)valuesArray maxCount:(NSUInteger)maxCount
{
  unint64_t v4;
  uint64_t v7;
  unint64_t v8;
  char v9;
  pxrInternal__aapl__pxrReserved__::VtValue *v10;
  _OWORD *v11;
  __int128 v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  if (0xAAAAAAAAAAAAAAABLL * ((self->super._timeSampledData.__end_ - self->super._timeSampledData.__begin_) >> 3) >= maxCount)
    v4 = maxCount;
  else
    v4 = 0xAAAAAAAAAAAAAAABLL * ((self->super._timeSampledData.__end_ - self->super._timeSampledData.__begin_) >> 3);
  if (v4)
  {
    v7 = 0;
    v8 = v4;
    do
    {
      v14[0] = 0;
      v14[1] = 0;
      sub_1DCB25EEC(v14, (TimeSampledVtValue *)((char *)self->super._timeSampledData.__begin_ + v7 + 8));
      v9 = sub_1DCBE06E4((pxrInternal__aapl__pxrReserved__::VtValue *)v14);
      v10 = (pxrInternal__aapl__pxrReserved__::VtValue *)v14;
      if ((v9 & 1) == 0)
        v10 = (pxrInternal__aapl__pxrReserved__::VtValue *)sub_1DCBE1320((pxrInternal__aapl__pxrReserved__::VtValue *)v14);
      v11 = (_OWORD *)sub_1DCBE13A8(v10);
      v12 = v11[1];
      *(_OWORD *)valuesArray->f64 = *v11;
      *(_OWORD *)&valuesArray->f64[2] = v12;
      ++valuesArray;
      sub_1DCAEEE2C((uint64_t)v14);
      v7 += 24;
      --v8;
    }
    while (v8);
  }
  return v4;
}

@end
