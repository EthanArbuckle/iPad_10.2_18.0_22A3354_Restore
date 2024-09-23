@implementation MDLAnimatedVector2

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MDLAnimatedVector2;
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
  if ((sub_1DCBDE098((pxrInternal__aapl__pxrReserved__::VtValue *)v5) & 1) != 0
    || (sub_1DCBDE0D0((pxrInternal__aapl__pxrReserved__::VtValue *)v5) & 1) != 0)
  {
    sub_1DCAEEE2C((uint64_t)v5);
    return 1;
  }
  v4 = sub_1DCBDE108((pxrInternal__aapl__pxrReserved__::VtValue *)v5);
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
  if (!sub_1DCBDE0D0((pxrInternal__aapl__pxrReserved__::VtValue *)v8))
  {
    if (sub_1DCBDE098((pxrInternal__aapl__pxrReserved__::VtValue *)v8))
    {
      *v3 = 0;
      v3[1] = (uint64_t)&off_1EA574E18 + 3;
      goto LABEL_9;
    }
    if (sub_1DCBDE108((pxrInternal__aapl__pxrReserved__::VtValue *)v8))
    {
      v3[1] = (uint64_t)&off_1EA574D60 + 2;
      v5 = operator new();
      *(_QWORD *)v5 = 0;
      *(_QWORD *)(v5 + 8) = 0;
      v6 = (unsigned int *)(v5 + 16);
      atomic_store(0, (unsigned int *)(v5 + 16));
      *v3 = v5;
      do
        v7 = __ldxr(v6);
      while (__stxr(v7 + 1, v6));
      goto LABEL_9;
    }
    self = (MDLAnimatedVector2 *)sub_1DCAEEE2C((uint64_t)v8);
LABEL_11:
    v3[1] = 0;
    goto LABEL_12;
  }
  v3[1] = (uint64_t)&off_1EA574ED0 + 3;
  *(_DWORD *)v3 = 0;
LABEL_9:
  self = (MDLAnimatedVector2 *)sub_1DCAEEE2C((uint64_t)v8);
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
  if ((sub_1DCBDE0D0((pxrInternal__aapl__pxrReserved__::VtValue *)v10) & 1) != 0
    || (sub_1DCBDE098((pxrInternal__aapl__pxrReserved__::VtValue *)v10) & 1) != 0
    || sub_1DCBDE108((pxrInternal__aapl__pxrReserved__::VtValue *)v10))
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
  if ((sub_1DCBDE0D0((pxrInternal__aapl__pxrReserved__::VtValue *)v10) & 1) != 0
    || (sub_1DCBDE098((pxrInternal__aapl__pxrReserved__::VtValue *)v10) & 1) != 0
    || sub_1DCBDE108((pxrInternal__aapl__pxrReserved__::VtValue *)v10))
  {
    v8 = a5 * a4;
    sub_1DCB25EEC(v9, v10);
    sub_1DCBD733C((uint64_t *)&self->super._timeSampledData, &v8);
    sub_1DCAEEE2C((uint64_t)v9);
  }
  sub_1DCAEEE2C((uint64_t)v10);
}

- (void)setFloat2:(vector_float2)value atTime:(NSTimeInterval)time
{
  TimeSampledVtValue *begin;
  uint64_t *p_timeSampledData;
  const char *v8;
  uint64_t v9;
  pxrInternal__aapl__pxrReserved__::VtValue *Typeid;
  pxrInternal__aapl__pxrReserved__::VtValue *v11;
  NSTimeInterval v12;
  _QWORD v13[2];
  _BYTE v14[16];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v15[1] = (char *)&off_1EA574E18 + 3;
  v15[0] = value;
  begin = self->super._timeSampledData.__begin_;
  p_timeSampledData = (uint64_t *)&self->super._timeSampledData;
  if (self->super._timeSampledData.__end_ != begin)
  {
    v12 = 0.0;
    v13[0] = 0;
    sub_1DCB25EEC(&v12, (_QWORD *)begin + 1);
    if ((sub_1DCBDE098((pxrInternal__aapl__pxrReserved__::VtValue *)&v12) & 1) == 0)
    {
      objc_msgSend_defaultVtValue(self, v8, v9);
      Typeid = (pxrInternal__aapl__pxrReserved__::VtValue *)pxrInternal__aapl__pxrReserved__::VtValue::GetTypeid((pxrInternal__aapl__pxrReserved__::VtValue *)v14);
      v11 = sub_1DCBE446C((pxrInternal__aapl__pxrReserved__::VtValue *)v15, Typeid);
      sub_1DCB9AD14(v15, v11);
      sub_1DCAEEE2C((uint64_t)v14);
    }
    sub_1DCAEEE2C((uint64_t)&v12);
  }
  v12 = time;
  sub_1DCB25EEC(v13, v15);
  sub_1DCBD7754(p_timeSampledData, &v12);
  sub_1DCAEEE2C((uint64_t)v13);
  sub_1DCAEEE2C((uint64_t)v15);
}

- (void)setDouble2:(vector_double2)value atTime:(NSTimeInterval)time
{
  uint64_t v6;
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
  v18[1] = (char *)&off_1EA574D60 + 2;
  v6 = operator new();
  *(vector_double2 *)v6 = value;
  v7 = (unsigned int *)(v6 + 16);
  atomic_store(0, (unsigned int *)(v6 + 16));
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
    if ((sub_1DCBDE108((pxrInternal__aapl__pxrReserved__::VtValue *)&v15) & 1) == 0)
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

- (vector_float2)float2AtTime:(NSTimeInterval)time
{
  vector_float2 v5;
  std::type_info *v6;
  float32x2_t *v7;
  float32x2_t v8;
  std::type_info *v10;
  float32x2_t *v11;
  float v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v16 = 0.0;
  v17 = 0;
  v18 = 0;
  v13 = 0.0;
  v14 = 0;
  v15 = 0;
  sub_1DCBD8170((double **)&self->super._timeSampledData, (uint64_t)&v16, (uint64_t)&v13, time);
  v5 = 0;
  if (v18)
  {
    if ((sub_1DCBDE098((pxrInternal__aapl__pxrReserved__::VtValue *)&v17) & 1) != 0
      || (v6 = sub_1DCBDEA4C((pxrInternal__aapl__pxrReserved__::VtValue *)&v17), sub_1DCB9AD14(&v17, v6), v18))
    {
      v7 = (float32x2_t *)sub_1DCBDEAD4((pxrInternal__aapl__pxrReserved__::VtValue *)&v17);
      v8 = *v7;
      if (!self->super._interpolation)
      {
LABEL_7:
        v5 = (vector_float2)*v7;
        goto LABEL_8;
      }
      if (v15)
      {
        if (v16 == v13)
          goto LABEL_7;
        if ((sub_1DCBDE098((pxrInternal__aapl__pxrReserved__::VtValue *)&v14) & 1) != 0
          || (v10 = sub_1DCBDEA4C((pxrInternal__aapl__pxrReserved__::VtValue *)&v14), sub_1DCB9AD14(&v14, v10), v15))
        {
          v11 = (float32x2_t *)sub_1DCBDEAD4((pxrInternal__aapl__pxrReserved__::VtValue *)&v14);
          v12 = fmax(fmin((time - v16) / (v13 - v16), 1.0), 0.0);
          v5 = (vector_float2)vmla_n_f32(vmul_n_f32(*v11, v12), v8, 1.0 - v12);
        }
      }
    }
  }
LABEL_8:
  sub_1DCAEEE2C((uint64_t)&v14);
  sub_1DCAEEE2C((uint64_t)&v17);
  return v5;
}

- (vector_double2)double2AtTime:(NSTimeInterval)time
{
  std::type_info *v5;
  float64x2_t *v6;
  float64x2_t v7;
  std::type_info *v8;
  float64x2_t *v9;
  double v10;
  float64x2_t v12;
  vector_double2 v13;
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
    if ((sub_1DCBDE108((pxrInternal__aapl__pxrReserved__::VtValue *)&v18) & 1) != 0
      || (v5 = sub_1DCBDECE4((pxrInternal__aapl__pxrReserved__::VtValue *)&v18), sub_1DCB9AD14(&v18, v5), v19))
    {
      v6 = (float64x2_t *)sub_1DCBDED6C((pxrInternal__aapl__pxrReserved__::VtValue *)&v18);
      v7 = *v6;
      if (!self->super._interpolation)
      {
LABEL_11:
        v13 = (vector_double2)v7;
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
        if ((sub_1DCBDE108((pxrInternal__aapl__pxrReserved__::VtValue *)&v15) & 1) != 0
          || (v8 = sub_1DCBDECE4((pxrInternal__aapl__pxrReserved__::VtValue *)&v15), sub_1DCB9AD14(&v15, v8), v16))
        {
          v9 = (float64x2_t *)sub_1DCBDED6C((pxrInternal__aapl__pxrReserved__::VtValue *)&v15);
          v10 = fmax(fmin((time - v17) / (v14 - v17), 1.0), 0.0);
          v7 = vmlaq_n_f64(vmulq_n_f64(*v9, v10), v12, 1.0 - v10);
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

- (void)resetWithFloat2Array:(const vector_float2 *)valuesArray atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)count
{
  TimeSampledVtValue *end;
  uint64_t *p_timeSampledData;
  TimeSampledVtValue *begin;
  TimeSampledVtValue *v12;
  uint64_t v13;
  vector_float2 v14;
  uint64_t v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
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
  for (self->super._timeSampledData.__end_ = begin; count; --count)
  {
    v13 = *(_QWORD *)timesArray;
    v14 = *valuesArray;
    v16[1] = (char *)&off_1EA574E18 + 3;
    v15 = v13;
    v16[0] = v14;
    sub_1DCBD733C(p_timeSampledData, &v15);
    sub_1DCAEEE2C((uint64_t)v16);
    ++valuesArray;
    ++timesArray;
  }
}

- (void)resetWithDouble2Array:(const vector_double2 *)valuesArray atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)count
{
  TimeSampledVtValue *end;
  uint64_t *p_timeSampledData;
  TimeSampledVtValue *begin;
  TimeSampledVtValue *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int *v15;
  unsigned int v16;
  vector_double2 v17;
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
      v17 = valuesArray[v13];
      v19[1] = (char *)&off_1EA574D60 + 2;
      v14 = operator new();
      *(vector_double2 *)v14 = v17;
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

- (NSUInteger)getFloat2Array:(vector_float2 *)valuesArray maxCount:(NSUInteger)maxCount
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
      v9 = sub_1DCBDE098((pxrInternal__aapl__pxrReserved__::VtValue *)v12);
      v10 = (pxrInternal__aapl__pxrReserved__::VtValue *)v12;
      if ((v9 & 1) == 0)
        v10 = (pxrInternal__aapl__pxrReserved__::VtValue *)sub_1DCBDEA4C((pxrInternal__aapl__pxrReserved__::VtValue *)v12);
      *valuesArray++ = *(vector_float2 *)sub_1DCBDEAD4(v10);
      sub_1DCAEEE2C((uint64_t)v12);
      v7 += 24;
      --v8;
    }
    while (v8);
  }
  return v4;
}

- (NSUInteger)getDouble2Array:(vector_double2 *)valuesArray maxCount:(NSUInteger)maxCount
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
      v9 = sub_1DCBDE108((pxrInternal__aapl__pxrReserved__::VtValue *)v12);
      v10 = (pxrInternal__aapl__pxrReserved__::VtValue *)v12;
      if ((v9 & 1) == 0)
        v10 = (pxrInternal__aapl__pxrReserved__::VtValue *)sub_1DCBDECE4((pxrInternal__aapl__pxrReserved__::VtValue *)v12);
      *valuesArray++ = *(vector_double2 *)sub_1DCBDED6C(v10);
      sub_1DCAEEE2C((uint64_t)v12);
      v7 += 24;
      --v8;
    }
    while (v8);
  }
  return v4;
}

@end
