@implementation MDLAnimatedScalar

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MDLAnimatedScalar;
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
  if ((sub_1DCB8CEE0((pxrInternal__aapl__pxrReserved__::VtValue *)v5) & 1) != 0
    || (sub_1DCBDCF8C((pxrInternal__aapl__pxrReserved__::VtValue *)v5) & 1) != 0)
  {
    sub_1DCAEEE2C((uint64_t)v5);
    return 1;
  }
  v4 = sub_1DCBD8894((pxrInternal__aapl__pxrReserved__::VtValue *)v5);
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
  _QWORD v5[3];
  VtValue result;

  v3 = v2;
  v5[2] = *MEMORY[0x1E0C80C00];
  begin = self->super._timeSampledData.__begin_;
  if (self->super._timeSampledData.__end_ == begin)
    goto LABEL_10;
  v5[0] = 0;
  v5[1] = 0;
  sub_1DCB25EEC(v5, (_QWORD *)begin + 1);
  if (!sub_1DCBDCF8C((pxrInternal__aapl__pxrReserved__::VtValue *)v5))
  {
    if (sub_1DCB8CEE0((pxrInternal__aapl__pxrReserved__::VtValue *)v5))
    {
      *(_QWORD *)(v3 + 8) = &unk_1EA5762F3;
      *(_DWORD *)v3 = 0;
      goto LABEL_8;
    }
    if (sub_1DCBD8894((pxrInternal__aapl__pxrReserved__::VtValue *)v5))
    {
      *(_QWORD *)v3 = 0;
      *(_QWORD *)(v3 + 8) = &unk_1EA57623B;
      goto LABEL_8;
    }
    self = (MDLAnimatedScalar *)sub_1DCAEEE2C((uint64_t)v5);
LABEL_10:
    *(_QWORD *)(v3 + 8) = 0;
    goto LABEL_11;
  }
  *(_QWORD *)(v3 + 8) = (char *)&off_1EA576010 + 3;
  *(_WORD *)v3 = 0;
LABEL_8:
  self = (MDLAnimatedScalar *)sub_1DCAEEE2C((uint64_t)v5);
LABEL_11:
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
  if ((sub_1DCBDCF8C((pxrInternal__aapl__pxrReserved__::VtValue *)v10) & 1) != 0
    || (sub_1DCB8CEE0((pxrInternal__aapl__pxrReserved__::VtValue *)v10) & 1) != 0
    || sub_1DCBD8894((pxrInternal__aapl__pxrReserved__::VtValue *)v10))
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
  if ((sub_1DCBDCF8C((pxrInternal__aapl__pxrReserved__::VtValue *)v10) & 1) != 0
    || (sub_1DCB8CEE0((pxrInternal__aapl__pxrReserved__::VtValue *)v10) & 1) != 0
    || sub_1DCBD8894((pxrInternal__aapl__pxrReserved__::VtValue *)v10))
  {
    v8 = a5 * a4;
    sub_1DCB25EEC(v9, v10);
    sub_1DCBD733C((uint64_t *)&self->super._timeSampledData, &v8);
    sub_1DCAEEE2C((uint64_t)v9);
  }
  sub_1DCAEEE2C((uint64_t)v10);
}

- (void)setFloat:(float)value atTime:(NSTimeInterval)time
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
  v15[1] = &unk_1EA5762F3;
  v15[0] = LODWORD(value);
  begin = self->super._timeSampledData.__begin_;
  p_timeSampledData = (uint64_t *)&self->super._timeSampledData;
  if (self->super._timeSampledData.__end_ != begin)
  {
    v12 = 0.0;
    v13[0] = 0;
    sub_1DCB25EEC(&v12, (_QWORD *)begin + 1);
    if ((sub_1DCB8CEE0((pxrInternal__aapl__pxrReserved__::VtValue *)&v12) & 1) == 0)
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

- (void)setDouble:(double)value atTime:(NSTimeInterval)time
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
  v15[1] = &unk_1EA57623B;
  *(double *)v15 = value;
  begin = self->super._timeSampledData.__begin_;
  p_timeSampledData = (uint64_t *)&self->super._timeSampledData;
  if (self->super._timeSampledData.__end_ != begin)
  {
    v12 = 0.0;
    v13[0] = 0;
    sub_1DCB25EEC(&v12, (_QWORD *)begin + 1);
    if ((sub_1DCBD8894((pxrInternal__aapl__pxrReserved__::VtValue *)&v12) & 1) == 0)
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

- (float)floatAtTime:(NSTimeInterval)time
{
  float v5;
  std::type_info *v6;
  float *v7;
  float v8;
  std::type_info *v10;
  float *v11;
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
  v5 = 0.0;
  if (v18)
  {
    if ((sub_1DCB8CEE0((pxrInternal__aapl__pxrReserved__::VtValue *)&v17) & 1) != 0
      || (v6 = sub_1DCBDD854((pxrInternal__aapl__pxrReserved__::VtValue *)&v17), sub_1DCB9AD14(&v17, v6), v18))
    {
      v7 = (float *)sub_1DCB8D100((pxrInternal__aapl__pxrReserved__::VtValue *)&v17);
      v8 = *v7;
      if (!self->super._interpolation)
      {
LABEL_7:
        v5 = *v7;
        goto LABEL_8;
      }
      if (v15)
      {
        if (v16 == v13)
          goto LABEL_7;
        if ((sub_1DCB8CEE0((pxrInternal__aapl__pxrReserved__::VtValue *)&v14) & 1) != 0
          || (v10 = sub_1DCBDD854((pxrInternal__aapl__pxrReserved__::VtValue *)&v14), sub_1DCB9AD14(&v14, v10), v15))
        {
          v11 = (float *)sub_1DCB8D100((pxrInternal__aapl__pxrReserved__::VtValue *)&v14);
          v12 = fmax(fmin((time - v16) / (v13 - v16), 1.0), 0.0);
          v5 = v8 + (float)((float)(*v11 - v8) * v12);
        }
      }
    }
  }
LABEL_8:
  sub_1DCAEEE2C((uint64_t)&v14);
  sub_1DCAEEE2C((uint64_t)&v17);
  return v5;
}

- (double)doubleAtTime:(NSTimeInterval)time
{
  double v5;
  std::type_info *v6;
  double *v7;
  double v8;
  std::type_info *v10;
  double *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15 = 0.0;
  v16 = 0;
  v17 = 0;
  v12 = 0.0;
  v13 = 0;
  v14 = 0;
  sub_1DCBD8170((double **)&self->super._timeSampledData, (uint64_t)&v15, (uint64_t)&v12, time);
  v5 = 0.0;
  if (v17)
  {
    if ((sub_1DCBD8894((pxrInternal__aapl__pxrReserved__::VtValue *)&v16) & 1) != 0
      || (v6 = sub_1DCBDDA78((pxrInternal__aapl__pxrReserved__::VtValue *)&v16), sub_1DCB9AD14(&v16, v6), v17))
    {
      v7 = (double *)sub_1DCBDDB00((pxrInternal__aapl__pxrReserved__::VtValue *)&v16);
      v8 = *v7;
      if (!self->super._interpolation)
      {
LABEL_7:
        v5 = *v7;
        goto LABEL_8;
      }
      if (v14)
      {
        if (v15 == v12)
          goto LABEL_7;
        if ((sub_1DCBD8894((pxrInternal__aapl__pxrReserved__::VtValue *)&v13) & 1) != 0
          || (v10 = sub_1DCBDDA78((pxrInternal__aapl__pxrReserved__::VtValue *)&v13), sub_1DCB9AD14(&v13, v10), v14))
        {
          v11 = (double *)sub_1DCBDDB00((pxrInternal__aapl__pxrReserved__::VtValue *)&v13);
          v5 = v8 + fmax(fmin((time - v15) / (v12 - v15), 1.0), 0.0) * (*v11 - v8);
        }
      }
    }
  }
LABEL_8:
  sub_1DCAEEE2C((uint64_t)&v13);
  sub_1DCAEEE2C((uint64_t)&v16);
  return v5;
}

- (void)resetWithFloatArray:(const float *)valuesArray atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)count
{
  TimeSampledVtValue *end;
  uint64_t *p_timeSampledData;
  TimeSampledVtValue *begin;
  TimeSampledVtValue *v12;
  int v13;
  uint64_t v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
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
    v14 = *(_QWORD *)timesArray;
    v13 = *(_DWORD *)valuesArray;
    v16 = &unk_1EA5762F3;
    v15 = v13;
    sub_1DCBD733C(p_timeSampledData, &v14);
    sub_1DCAEEE2C((uint64_t)&v15);
    ++valuesArray;
    ++timesArray;
  }
}

- (void)resetWithDoubleArray:(const double *)valuesArray atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)count
{
  TimeSampledVtValue *end;
  uint64_t *p_timeSampledData;
  TimeSampledVtValue *begin;
  TimeSampledVtValue *v12;
  uint64_t v13;
  uint64_t v14;
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
    v14 = *(_QWORD *)valuesArray;
    v16[1] = &unk_1EA57623B;
    v15 = v13;
    v16[0] = v14;
    sub_1DCBD733C(p_timeSampledData, &v15);
    sub_1DCAEEE2C((uint64_t)v16);
    ++valuesArray;
    ++timesArray;
  }
}

- (NSUInteger)getFloatArray:(float *)valuesArray maxCount:(NSUInteger)maxCount
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
      v9 = sub_1DCB8CEE0((pxrInternal__aapl__pxrReserved__::VtValue *)v12);
      v10 = (pxrInternal__aapl__pxrReserved__::VtValue *)v12;
      if ((v9 & 1) == 0)
        v10 = (pxrInternal__aapl__pxrReserved__::VtValue *)sub_1DCBDD854((pxrInternal__aapl__pxrReserved__::VtValue *)v12);
      *valuesArray++ = *(float *)sub_1DCB8D100(v10);
      sub_1DCAEEE2C((uint64_t)v12);
      v7 += 24;
      --v8;
    }
    while (v8);
  }
  return v4;
}

- (NSUInteger)getDoubleArray:(double *)valuesArray maxCount:(NSUInteger)maxCount
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
      v9 = sub_1DCBD8894((pxrInternal__aapl__pxrReserved__::VtValue *)v12);
      v10 = (pxrInternal__aapl__pxrReserved__::VtValue *)v12;
      if ((v9 & 1) == 0)
        v10 = (pxrInternal__aapl__pxrReserved__::VtValue *)sub_1DCBDDA78((pxrInternal__aapl__pxrReserved__::VtValue *)v12);
      *valuesArray++ = *(double *)sub_1DCBDDB00(v10);
      sub_1DCAEEE2C((uint64_t)v12);
      v7 += 24;
      --v8;
    }
    while (v8);
  }
  return v4;
}

@end
