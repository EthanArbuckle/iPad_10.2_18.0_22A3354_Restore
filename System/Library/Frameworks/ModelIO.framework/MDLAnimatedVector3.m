@implementation MDLAnimatedVector3

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MDLAnimatedVector3;
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
  if ((sub_1DCB8CE70((pxrInternal__aapl__pxrReserved__::VtValue *)v5) & 1) != 0
    || (sub_1DCBDF348((pxrInternal__aapl__pxrReserved__::VtValue *)v5) & 1) != 0)
  {
    sub_1DCAEEE2C((uint64_t)v5);
    return 1;
  }
  v4 = sub_1DCBDA610((pxrInternal__aapl__pxrReserved__::VtValue *)v5);
  sub_1DCAEEE2C((uint64_t)v5);
  if ((v4 & 1) == 0)
    return 0;
  else
    return 2;
}

- (VtValue)defaultVtValue
{
  uint64_t v2;
  uint64_t v3;
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
  if (!sub_1DCBDF348((pxrInternal__aapl__pxrReserved__::VtValue *)v11))
  {
    if (sub_1DCB8CE70((pxrInternal__aapl__pxrReserved__::VtValue *)v11))
    {
      *(_QWORD *)(v3 + 8) = (char *)&off_1EA575040 + 2;
      v5 = operator new();
      *(_DWORD *)(v5 + 8) = 0;
      *(_QWORD *)v5 = 0;
      v6 = (unsigned int *)(v5 + 12);
      atomic_store(0, (unsigned int *)(v5 + 12));
      *(_QWORD *)v3 = v5;
      do
        v7 = __ldxr(v6);
      while (__stxr(v7 + 1, v6));
      goto LABEL_11;
    }
    if (sub_1DCBDA610((pxrInternal__aapl__pxrReserved__::VtValue *)v11))
    {
      *(_QWORD *)(v3 + 8) = (char *)&off_1EA574F88 + 2;
      v8 = operator new();
      *(_QWORD *)v8 = 0;
      *(_QWORD *)(v8 + 8) = 0;
      *(_QWORD *)(v8 + 16) = 0;
      v9 = (unsigned int *)(v8 + 24);
      atomic_store(0, (unsigned int *)(v8 + 24));
      *(_QWORD *)v3 = v8;
      do
        v10 = __ldxr(v9);
      while (__stxr(v10 + 1, v9));
      goto LABEL_11;
    }
    self = (MDLAnimatedVector3 *)sub_1DCAEEE2C((uint64_t)v11);
LABEL_13:
    *(_QWORD *)(v3 + 8) = 0;
    goto LABEL_14;
  }
  *(_WORD *)(v3 + 4) = 0;
  *(_DWORD *)v3 = 0;
  *(_QWORD *)(v3 + 8) = (char *)&off_1EA5750F8 + 3;
LABEL_11:
  self = (MDLAnimatedVector3 *)sub_1DCAEEE2C((uint64_t)v11);
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
  if ((sub_1DCBDF348((pxrInternal__aapl__pxrReserved__::VtValue *)v10) & 1) != 0
    || (sub_1DCB8CE70((pxrInternal__aapl__pxrReserved__::VtValue *)v10) & 1) != 0
    || sub_1DCBDA610((pxrInternal__aapl__pxrReserved__::VtValue *)v10))
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
  if ((sub_1DCBDF348((pxrInternal__aapl__pxrReserved__::VtValue *)v10) & 1) != 0
    || (sub_1DCB8CE70((pxrInternal__aapl__pxrReserved__::VtValue *)v10) & 1) != 0
    || sub_1DCBDA610((pxrInternal__aapl__pxrReserved__::VtValue *)v10))
  {
    v8 = a5 * a4;
    sub_1DCB25EEC(v9, v10);
    sub_1DCBD733C((uint64_t *)&self->super._timeSampledData, &v8);
    sub_1DCAEEE2C((uint64_t)v9);
  }
  sub_1DCAEEE2C((uint64_t)v10);
}

- (void)setFloat3:(vector_float3)value atTime:(NSTimeInterval)time
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  unsigned int *v8;
  unsigned int v9;
  TimeSampledVtValue *begin;
  const char *v11;
  uint64_t v12;
  pxrInternal__aapl__pxrReserved__::VtValue *Typeid;
  pxrInternal__aapl__pxrReserved__::VtValue *v14;
  __int128 v15;
  uint64_t v16;
  _QWORD v17[2];
  _BYTE v18[16];
  _QWORD v19[3];

  v5 = v4;
  v15 = *(_OWORD *)&time;
  v19[2] = *MEMORY[0x1E0C80C00];
  v19[1] = (char *)&off_1EA575040 + 2;
  v7 = operator new();
  *(_QWORD *)v7 = v15;
  *(_DWORD *)(v7 + 8) = DWORD2(v15);
  v8 = (unsigned int *)(v7 + 12);
  atomic_store(0, (unsigned int *)(v7 + 12));
  v19[0] = v7;
  do
    v9 = __ldxr(v8);
  while (__stxr(v9 + 1, v8));
  begin = self->super._timeSampledData.__begin_;
  if (self->super._timeSampledData.__end_ != begin)
  {
    v16 = 0;
    v17[0] = 0;
    sub_1DCB25EEC(&v16, (_QWORD *)begin + 1);
    if ((sub_1DCB8CE70((pxrInternal__aapl__pxrReserved__::VtValue *)&v16) & 1) == 0)
    {
      objc_msgSend_defaultVtValue(self, v11, v12);
      Typeid = (pxrInternal__aapl__pxrReserved__::VtValue *)pxrInternal__aapl__pxrReserved__::VtValue::GetTypeid((pxrInternal__aapl__pxrReserved__::VtValue *)v18);
      v14 = sub_1DCBE446C((pxrInternal__aapl__pxrReserved__::VtValue *)v19, Typeid);
      sub_1DCB9AD14(v19, v14);
      sub_1DCAEEE2C((uint64_t)v18);
    }
    sub_1DCAEEE2C((uint64_t)&v16);
  }
  v16 = v5;
  sub_1DCB25EEC(v17, v19);
  sub_1DCBD7754((uint64_t *)&self->super._timeSampledData, (double *)&v16);
  sub_1DCAEEE2C((uint64_t)v17);
  sub_1DCAEEE2C((uint64_t)v19);
}

- (uint64_t)setDouble3:(uint64_t)a3 atTime:(__int128 *)a4
{
  uint64_t v6;
  uint64_t v7;
  unsigned int *v8;
  unsigned int v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  pxrInternal__aapl__pxrReserved__::VtValue *Typeid;
  pxrInternal__aapl__pxrReserved__::VtValue *v14;
  __int128 v16;
  double v17;
  _QWORD v18[2];
  _BYTE v19[16];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v16 = *a4;
  v6 = *((_QWORD *)a4 + 2);
  v20[1] = (char *)&off_1EA574F88 + 2;
  v7 = operator new();
  *(_OWORD *)v7 = v16;
  *(_QWORD *)(v7 + 16) = v6;
  v8 = (unsigned int *)(v7 + 24);
  atomic_store(0, (unsigned int *)(v7 + 24));
  v20[0] = v7;
  do
    v9 = __ldxr(v8);
  while (__stxr(v9 + 1, v8));
  v10 = a1[1];
  if (a1[2] != v10)
  {
    v17 = 0.0;
    v18[0] = 0;
    sub_1DCB25EEC(&v17, (_QWORD *)(v10 + 8));
    if ((sub_1DCBDA610((pxrInternal__aapl__pxrReserved__::VtValue *)&v17) & 1) == 0)
    {
      objc_msgSend_defaultVtValue(a1, v11, v12);
      Typeid = (pxrInternal__aapl__pxrReserved__::VtValue *)pxrInternal__aapl__pxrReserved__::VtValue::GetTypeid((pxrInternal__aapl__pxrReserved__::VtValue *)v19);
      v14 = sub_1DCBE446C((pxrInternal__aapl__pxrReserved__::VtValue *)v20, Typeid);
      sub_1DCB9AD14(v20, v14);
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

- (vector_float3)float3AtTime:(NSTimeInterval)time
{
  std::type_info *v4;
  std::type_info *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  vector_float3 result;

  v14 = *MEMORY[0x1E0C80C00];
  v11 = 0.0;
  v12 = 0;
  v13 = 0;
  v8 = 0.0;
  v9 = 0;
  v10 = 0;
  sub_1DCBD8170((double **)&self->super._timeSampledData, (uint64_t)&v11, (uint64_t)&v8, time);
  if (v13)
  {
    if ((sub_1DCB8CE70((pxrInternal__aapl__pxrReserved__::VtValue *)&v12) & 1) != 0
      || (v4 = sub_1DCBDFD3C((pxrInternal__aapl__pxrReserved__::VtValue *)&v12), sub_1DCB9AD14(&v12, v4), v13))
    {
      sub_1DCB8D098((pxrInternal__aapl__pxrReserved__::VtValue *)&v12);
      if (self->super._interpolation)
      {
        if (v10)
        {
          if (v11 != v8)
          {
            if ((sub_1DCB8CE70((pxrInternal__aapl__pxrReserved__::VtValue *)&v9) & 1) != 0
              || (v5 = sub_1DCBDFD3C((pxrInternal__aapl__pxrReserved__::VtValue *)&v9), sub_1DCB9AD14(&v9, v5), v10))
            {
              sub_1DCB8D098((pxrInternal__aapl__pxrReserved__::VtValue *)&v9);
            }
          }
        }
      }
    }
  }
  sub_1DCAEEE2C((uint64_t)&v9);
  v6 = sub_1DCAEEE2C((uint64_t)&v12);
  result.i64[1] = v7;
  result.i64[0] = v6;
  return result;
}

- (uint64_t)double3AtTime:(double)a3@<D0>
{
  float64x2_t v6;
  std::type_info *v7;
  uint64_t v8;
  int8x16_t v9;
  unint64_t v10;
  std::type_info *v11;
  float64x2_t *v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  uint64_t result;
  unint64_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64_t v21;
  int8x16_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v26 = 0.0;
  v27 = 0;
  v28 = 0;
  v23 = 0.0;
  v24 = 0;
  v25 = 0;
  sub_1DCBD8170((double **)(a1 + 8), (uint64_t)&v26, (uint64_t)&v23, a3);
  if (!v28)
    goto LABEL_11;
  if ((sub_1DCBDA610((pxrInternal__aapl__pxrReserved__::VtValue *)&v27) & 1) == 0)
  {
    v7 = sub_1DCBDFFD0((pxrInternal__aapl__pxrReserved__::VtValue *)&v27);
    sub_1DCB9AD14(&v27, v7);
    if (!v28)
      goto LABEL_11;
  }
  v8 = sub_1DCBE0058((pxrInternal__aapl__pxrReserved__::VtValue *)&v27);
  v9 = *(int8x16_t *)v8;
  v6.f64[0] = *(float64_t *)(v8 + 16);
  v19 = v6;
  v21 = *(double *)v8;
  v18 = vextq_s8(v9, v9, 8uLL).u64[0];
  if (*(_QWORD *)(a1 + 32))
  {
    if (v25)
    {
      if (v26 == v23)
        goto LABEL_7;
      if ((sub_1DCBDA610((pxrInternal__aapl__pxrReserved__::VtValue *)&v24) & 1) != 0
        || (v11 = sub_1DCBDFFD0((pxrInternal__aapl__pxrReserved__::VtValue *)&v24), sub_1DCB9AD14(&v24, v11), v25))
      {
        v12 = (float64x2_t *)sub_1DCBE0058((pxrInternal__aapl__pxrReserved__::VtValue *)&v24);
        v13.f64[0] = v12[1].f64[0];
        v14.f64[0] = fmax(fmin((a3 - v26) / (v23 - v26), 1.0), 0.0);
        v15.f64[0] = 1.0 - v14.f64[0];
        v16.f64[0] = v21;
        *(_QWORD *)&v16.f64[1] = v18;
        v9 = (int8x16_t)vmlaq_n_f64(vmulq_n_f64(*v12, v14.f64[0]), v16, 1.0 - v14.f64[0]);
        v10 = vextq_s8(v9, v9, 8uLL).u64[0];
        v6 = vmlaq_f64(vmulq_f64(v14, v13), v19, v15);
        goto LABEL_12;
      }
    }
LABEL_11:
    v9.i64[0] = 0;
    v10 = 0;
    v6.f64[0] = 0.0;
    goto LABEL_12;
  }
LABEL_7:
  v10 = v18;
LABEL_12:
  *(float64_t *)(a2 + 16) = v6.f64[0];
  v9.i64[1] = v10;
  v20 = v6;
  v22 = v9;
  *(int8x16_t *)a2 = v9;
  sub_1DCAEEE2C((uint64_t)&v24);
  result = sub_1DCAEEE2C((uint64_t)&v27);
  *(int8x16_t *)a2 = v22;
  *(float64x2_t *)(a2 + 16) = v20;
  return result;
}

- (void)resetWithFloat3Array:(const vector_float3 *)valuesArray atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)count
{
  TimeSampledVtValue *end;
  uint64_t *p_timeSampledData;
  TimeSampledVtValue *begin;
  TimeSampledVtValue *v12;
  uint64_t v13;
  const vector_float3 *v14;
  __int32 v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int *v18;
  unsigned int v19;
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
      v15 = v14->i32[2];
      v21[1] = (char *)&off_1EA575040 + 2;
      v16 = v14->i64[0];
      v17 = operator new();
      *(_QWORD *)v17 = v16;
      *(_DWORD *)(v17 + 8) = v15;
      v18 = (unsigned int *)(v17 + 12);
      atomic_store(0, (unsigned int *)(v17 + 12));
      v21[0] = v17;
      do
        v19 = __ldxr(v18);
      while (__stxr(v19 + 1, v18));
      sub_1DCBD733C(p_timeSampledData, &v20);
      sub_1DCAEEE2C((uint64_t)v21);
      ++v13;
    }
    while (v13 != count);
  }
}

- (void)resetWithDouble3Array:(const vector_double3 *)valuesArray atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)count
{
  TimeSampledVtValue *end;
  uint64_t *p_timeSampledData;
  TimeSampledVtValue *begin;
  TimeSampledVtValue *v12;
  uint64_t v13;
  const vector_double3 *v14;
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
      v18 = *(_OWORD *)&v14->f64[2];
      v19 = *(_OWORD *)v14->f64;
      v21[1] = (char *)&off_1EA574F88 + 2;
      v15 = operator new();
      *(_OWORD *)v15 = v19;
      *(_QWORD *)(v15 + 16) = v18;
      v16 = (unsigned int *)(v15 + 24);
      atomic_store(0, (unsigned int *)(v15 + 24));
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

- (NSUInteger)getFloat3Array:(vector_float3 *)valuesArray maxCount:(NSUInteger)maxCount
{
  unint64_t v4;
  uint64_t v7;
  unint64_t v8;
  char v9;
  pxrInternal__aapl__pxrReserved__::VtValue *v10;
  uint64_t v11;
  vector_float3 v12;
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
      v9 = sub_1DCB8CE70((pxrInternal__aapl__pxrReserved__::VtValue *)v14);
      v10 = (pxrInternal__aapl__pxrReserved__::VtValue *)v14;
      if ((v9 & 1) == 0)
        v10 = (pxrInternal__aapl__pxrReserved__::VtValue *)sub_1DCBDFD3C((pxrInternal__aapl__pxrReserved__::VtValue *)v14);
      v11 = sub_1DCB8D098(v10);
      v12.i64[0] = *(_QWORD *)v11;
      v12.i32[2] = *(_DWORD *)(v11 + 8);
      *valuesArray++ = v12;
      sub_1DCAEEE2C((uint64_t)v14);
      v7 += 24;
      --v8;
    }
    while (v8);
  }
  return v4;
}

- (NSUInteger)getDouble3Array:(vector_double3 *)valuesArray maxCount:(NSUInteger)maxCount
{
  unint64_t v4;
  uint64_t v7;
  unint64_t v8;
  char v9;
  pxrInternal__aapl__pxrReserved__::VtValue *v10;
  uint64_t v11;
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
      v9 = sub_1DCBDA610((pxrInternal__aapl__pxrReserved__::VtValue *)v14);
      v10 = (pxrInternal__aapl__pxrReserved__::VtValue *)v14;
      if ((v9 & 1) == 0)
        v10 = (pxrInternal__aapl__pxrReserved__::VtValue *)sub_1DCBDFFD0((pxrInternal__aapl__pxrReserved__::VtValue *)v14);
      v11 = sub_1DCBE0058(v10);
      *(_QWORD *)&v12 = *(_QWORD *)(v11 + 16);
      *(_OWORD *)valuesArray->f64 = *(_OWORD *)v11;
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
