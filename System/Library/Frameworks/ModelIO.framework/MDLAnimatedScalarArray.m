@implementation MDLAnimatedScalarArray

- (id)initWithElementCount:(NSUInteger)arrayElementCount
{
  MDLAnimatedScalarArray *v4;
  MDLAnimatedScalarArray *v5;
  MDLAnimatedScalarArray *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MDLAnimatedScalarArray;
  v4 = -[MDLAnimatedValue init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_elementCount = arrayElementCount;
    v6 = v4;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MDLAnimatedScalarArray;
  result = -[MDLAnimatedValue copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 5) = self->_elementCount;
  return result;
}

- (NSUInteger)elementCount
{
  return self->_elementCount;
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
  if ((sub_1DCB44F28((pxrInternal__aapl__pxrReserved__::VtValue *)v5) & 1) != 0
    || (sub_1DCBD6DC0((pxrInternal__aapl__pxrReserved__::VtValue *)v5) & 1) != 0)
  {
    sub_1DCAEEE2C((uint64_t)v5);
    return 1;
  }
  v4 = sub_1DCBD6DF8((pxrInternal__aapl__pxrReserved__::VtValue *)v5);
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
  _BYTE v5[40];
  _QWORD v6[3];
  VtValue result;

  v3 = v2;
  v6[2] = *MEMORY[0x1E0C80C00];
  begin = self->super._timeSampledData.__begin_;
  if (self->super._timeSampledData.__end_ == begin)
    goto LABEL_10;
  v6[0] = 0;
  v6[1] = 0;
  sub_1DCB25EEC(v6, (_QWORD *)begin + 1);
  if (!sub_1DCBD6DC0((pxrInternal__aapl__pxrReserved__::VtValue *)v6))
  {
    if (sub_1DCB44F28((pxrInternal__aapl__pxrReserved__::VtValue *)v6))
    {
      sub_1DCB43828((uint64_t)v5, 0);
      v3[1] = (uint64_t)&off_1EA575D30;
      sub_1DCB46DC8(v3, (uint64_t)v5);
      sub_1DCAEEE78((uint64_t)v5);
      goto LABEL_8;
    }
    if (sub_1DCBD6DF8((pxrInternal__aapl__pxrReserved__::VtValue *)v6))
    {
      sub_1DCB43FBC((uint64_t)v5, 0);
      v3[1] = (uint64_t)&off_1EA575C78;
      sub_1DCB46DC8(v3, (uint64_t)v5);
      sub_1DCAEEE78((uint64_t)v5);
      goto LABEL_8;
    }
    self = (MDLAnimatedScalarArray *)sub_1DCAEEE2C((uint64_t)v6);
LABEL_10:
    v3[1] = 0;
    goto LABEL_11;
  }
  sub_1DCBD6FE0((uint64_t)v5, 0);
  v3[1] = (uint64_t)&off_1EA575BC0;
  sub_1DCB272BC(v3, (uint64_t)v5);
  sub_1DCAEEE78((uint64_t)v5);
LABEL_8:
  self = (MDLAnimatedScalarArray *)sub_1DCAEEE2C((uint64_t)v6);
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
  if ((sub_1DCBD6DC0((pxrInternal__aapl__pxrReserved__::VtValue *)v10) & 1) != 0
    || (sub_1DCB44F28((pxrInternal__aapl__pxrReserved__::VtValue *)v10) & 1) != 0
    || sub_1DCBD6DF8((pxrInternal__aapl__pxrReserved__::VtValue *)v10))
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
  if ((sub_1DCBD6DC0((pxrInternal__aapl__pxrReserved__::VtValue *)v10) & 1) != 0
    || (sub_1DCB44F28((pxrInternal__aapl__pxrReserved__::VtValue *)v10) & 1) != 0
    || sub_1DCBD6DF8((pxrInternal__aapl__pxrReserved__::VtValue *)v10))
  {
    v8 = a5 * a4;
    sub_1DCB25EEC(v9, v10);
    sub_1DCBD733C((uint64_t *)&self->super._timeSampledData, &v8);
    sub_1DCAEEE2C((uint64_t)v9);
  }
  sub_1DCAEEE2C((uint64_t)v10);
}

- (void)setFloatArray:(const float *)array count:(NSUInteger)count atTime:(NSTimeInterval)time
{
  unint64_t elementCount;
  uint64_t v10;
  float v11;
  TimeSampledVtValue *begin;
  const char *v13;
  uint64_t v14;
  pxrInternal__aapl__pxrReserved__::VtValue *Typeid;
  pxrInternal__aapl__pxrReserved__::VtValue *v16;
  _OWORD v17[2];
  uint64_t v18;
  NSTimeInterval v19;
  _QWORD v20[2];
  _BYTE v21[16];
  uint64_t v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  elementCount = self->_elementCount;
  if (elementCount == count)
  {
    v18 = 0;
    memset(v17, 0, sizeof(v17));
    sub_1DCB43828((uint64_t)v17, count);
    if (count)
    {
      v10 = 0;
      do
      {
        v11 = array[v10];
        sub_1DCB30E20((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v17);
        *(float *)(v18 + 4 * v10++) = v11;
      }
      while (count != v10);
    }
    v22[0] = 0;
    v22[1] = (uint64_t)&off_1EA575D30;
    sub_1DCB46DC8(v22, (uint64_t)v17);
    begin = self->super._timeSampledData.__begin_;
    if (self->super._timeSampledData.__end_ != begin)
    {
      v19 = 0.0;
      v20[0] = 0;
      sub_1DCB25EEC(&v19, (_QWORD *)begin + 1);
      if ((sub_1DCB44F28((pxrInternal__aapl__pxrReserved__::VtValue *)&v19) & 1) == 0)
      {
        objc_msgSend_defaultVtValue(self, v13, v14);
        Typeid = (pxrInternal__aapl__pxrReserved__::VtValue *)pxrInternal__aapl__pxrReserved__::VtValue::GetTypeid((pxrInternal__aapl__pxrReserved__::VtValue *)v21);
        v16 = sub_1DCBE446C((pxrInternal__aapl__pxrReserved__::VtValue *)v22, Typeid);
        sub_1DCB9AD14(v22, v16);
        sub_1DCAEEE2C((uint64_t)v21);
      }
      sub_1DCAEEE2C((uint64_t)&v19);
    }
    v19 = time;
    sub_1DCB25EEC(v20, v22);
    sub_1DCBD7754((uint64_t *)&self->super._timeSampledData, &v19);
    sub_1DCAEEE2C((uint64_t)v20);
    sub_1DCAEEE2C((uint64_t)v22);
    sub_1DCAEEE78((uint64_t)v17);
  }
  else
  {
    NSLog(CFSTR("array count (%lu) has to match MDLAnimatedScalarArray.elementCount (%lu)"), a2, array, time, count, elementCount);
  }
}

- (void)setDoubleArray:(const double *)array count:(NSUInteger)count atTime:(NSTimeInterval)time
{
  unint64_t elementCount;
  uint64_t v10;
  double v11;
  TimeSampledVtValue *begin;
  const char *v13;
  uint64_t v14;
  pxrInternal__aapl__pxrReserved__::VtValue *Typeid;
  pxrInternal__aapl__pxrReserved__::VtValue *v16;
  _OWORD v17[2];
  uint64_t v18;
  NSTimeInterval v19;
  _QWORD v20[2];
  _BYTE v21[16];
  uint64_t v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  elementCount = self->_elementCount;
  if (elementCount == count)
  {
    v18 = 0;
    memset(v17, 0, sizeof(v17));
    sub_1DCB43FBC((uint64_t)v17, count);
    if (count)
    {
      v10 = 0;
      do
      {
        v11 = array[v10];
        sub_1DCB47160((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v17);
        *(double *)(v18 + 8 * v10++) = v11;
      }
      while (count != v10);
    }
    v22[0] = 0;
    v22[1] = (uint64_t)&off_1EA575C78;
    sub_1DCB46DC8(v22, (uint64_t)v17);
    begin = self->super._timeSampledData.__begin_;
    if (self->super._timeSampledData.__end_ != begin)
    {
      v19 = 0.0;
      v20[0] = 0;
      sub_1DCB25EEC(&v19, (_QWORD *)begin + 1);
      if ((sub_1DCBD6DF8((pxrInternal__aapl__pxrReserved__::VtValue *)&v19) & 1) == 0)
      {
        objc_msgSend_defaultVtValue(self, v13, v14);
        Typeid = (pxrInternal__aapl__pxrReserved__::VtValue *)pxrInternal__aapl__pxrReserved__::VtValue::GetTypeid((pxrInternal__aapl__pxrReserved__::VtValue *)v21);
        v16 = sub_1DCBE446C((pxrInternal__aapl__pxrReserved__::VtValue *)v22, Typeid);
        sub_1DCB9AD14(v22, v16);
        sub_1DCAEEE2C((uint64_t)v21);
      }
      sub_1DCAEEE2C((uint64_t)&v19);
    }
    v19 = time;
    sub_1DCB25EEC(v20, v22);
    sub_1DCBD7754((uint64_t *)&self->super._timeSampledData, &v19);
    sub_1DCAEEE2C((uint64_t)v20);
    sub_1DCAEEE2C((uint64_t)v22);
    sub_1DCAEEE78((uint64_t)v17);
  }
  else
  {
    NSLog(CFSTR("array count (%lu) has to match MDLAnimatedScalarArray.elementCount (%lu)"), a2, array, time, count, elementCount);
  }
}

- (NSUInteger)getFloatArray:(float *)array maxCount:(NSUInteger)maxCount atTime:(NSTimeInterval)time
{
  NSUInteger v5;
  NSUInteger elementCount;
  std::type_info *v10;
  __int128 *v11;
  uint64_t j;
  uint64_t i;
  std::type_info *v14;
  __int128 *v15;
  NSUInteger v16;
  uint64_t v17;
  float v18;
  float v19;
  _OWORD v21[2];
  uint64_t v22;
  _OWORD v23[2];
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v5 = maxCount;
  v31 = *MEMORY[0x1E0C80C00];
  elementCount = self->_elementCount;
  if (elementCount <= maxCount)
  {
    v28 = 0.0;
    v29 = 0;
    v30 = 0;
    v25 = 0.0;
    v26 = 0;
    v27 = 0;
    v24 = 0;
    memset(v23, 0, sizeof(v23));
    v22 = 0;
    memset(v21, 0, sizeof(v21));
    sub_1DCBD8170((double **)&self->super._timeSampledData, (uint64_t)&v28, (uint64_t)&v25, time);
    if (v30)
    {
      if ((sub_1DCB44F28((pxrInternal__aapl__pxrReserved__::VtValue *)&v29) & 1) != 0
        || (v10 = sub_1DCBD8360((pxrInternal__aapl__pxrReserved__::VtValue *)&v29), sub_1DCB9AD14(&v29, v10), v30))
      {
        v11 = (__int128 *)sub_1DCB41744((pxrInternal__aapl__pxrReserved__::VtValue *)&v29);
        sub_1DCB306B8((uint64_t)v23, v11);
        if (!self->super._interpolation)
        {
          if (*(_QWORD *)&v23[0] < v5)
            v5 = *(_QWORD *)&v23[0];
          if (v5)
          {
            for (i = 0; i != v5; ++i)
            {
              sub_1DCB30E20((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v23);
              array[i] = *(float *)(v24 + 4 * i);
            }
          }
          goto LABEL_32;
        }
        if (v27)
        {
          if (v28 == v25)
          {
            if (*(_QWORD *)&v23[0] < v5)
              v5 = *(_QWORD *)&v23[0];
            if (v5)
            {
              for (j = 0; j != v5; ++j)
              {
                sub_1DCB30E20((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v23);
                array[j] = *(float *)(v24 + 4 * j);
              }
            }
            goto LABEL_32;
          }
          if ((sub_1DCB8CEE0((pxrInternal__aapl__pxrReserved__::VtValue *)&v26) & 1) != 0
            || (v14 = sub_1DCBD8360((pxrInternal__aapl__pxrReserved__::VtValue *)&v26), sub_1DCB9AD14(&v26, v14), v27))
          {
            v15 = (__int128 *)sub_1DCB41744((pxrInternal__aapl__pxrReserved__::VtValue *)&v26);
            sub_1DCB306B8((uint64_t)v21, v15);
            v16 = *(_QWORD *)&v23[0];
            if (*(_QWORD *)&v21[0] < *(_QWORD *)&v23[0])
              v16 = *(_QWORD *)&v21[0];
            if (v16 < v5)
              v5 = v16;
            if (v5)
            {
              v17 = 0;
              v18 = fmax(fmin((time - v28) / (v25 - v28), 1.0), 0.0);
              do
              {
                sub_1DCB30E20((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v23);
                v19 = *(float *)(v24 + 4 * v17);
                sub_1DCB30E20((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v21);
                array[v17] = v19 + (float)((float)(*(float *)(v22 + 4 * v17) - v19) * v18);
                ++v17;
              }
              while (v5 != v17);
            }
            goto LABEL_32;
          }
        }
      }
    }
    v5 = 0;
LABEL_32:
    sub_1DCAEEE78((uint64_t)v21);
    sub_1DCAEEE78((uint64_t)v23);
    sub_1DCAEEE2C((uint64_t)&v26);
    sub_1DCAEEE2C((uint64_t)&v29);
    return v5;
  }
  NSLog(CFSTR("array count (%lu) has to match MDLAnimatedScalarArray.elementCount (%lu)"), a2, array, time, maxCount, elementCount);
  return 0;
}

- (NSUInteger)getDoubleArray:(double *)array maxCount:(NSUInteger)maxCount atTime:(NSTimeInterval)time
{
  NSUInteger v5;
  NSUInteger elementCount;
  std::type_info *v10;
  __int128 *v11;
  uint64_t j;
  uint64_t i;
  std::type_info *v14;
  __int128 *v15;
  NSUInteger v16;
  uint64_t v17;
  double v18;
  double v19;
  _OWORD v21[2];
  uint64_t v22;
  _OWORD v23[2];
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v5 = maxCount;
  v31 = *MEMORY[0x1E0C80C00];
  elementCount = self->_elementCount;
  if (elementCount <= maxCount)
  {
    v28 = 0.0;
    v29 = 0;
    v30 = 0;
    v25 = 0.0;
    v26 = 0;
    v27 = 0;
    v24 = 0;
    memset(v23, 0, sizeof(v23));
    v22 = 0;
    memset(v21, 0, sizeof(v21));
    sub_1DCBD8170((double **)&self->super._timeSampledData, (uint64_t)&v28, (uint64_t)&v25, time);
    if (v30)
    {
      if ((sub_1DCBD6DF8((pxrInternal__aapl__pxrReserved__::VtValue *)&v29) & 1) != 0
        || (v10 = sub_1DCBD86EC((pxrInternal__aapl__pxrReserved__::VtValue *)&v29), sub_1DCB9AD14(&v29, v10), v30))
      {
        v11 = (__int128 *)sub_1DCBD8774((pxrInternal__aapl__pxrReserved__::VtValue *)&v29);
        sub_1DCBD87DC((uint64_t)v23, v11);
        if (!self->super._interpolation)
        {
          if (*(_QWORD *)&v23[0] < v5)
            v5 = *(_QWORD *)&v23[0];
          if (v5)
          {
            for (i = 0; i != v5; ++i)
            {
              sub_1DCB47160((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v23);
              array[i] = *(double *)(v24 + 8 * i);
            }
          }
          goto LABEL_32;
        }
        if (v27)
        {
          if (v28 == v25)
          {
            if (*(_QWORD *)&v23[0] < v5)
              v5 = *(_QWORD *)&v23[0];
            if (v5)
            {
              for (j = 0; j != v5; ++j)
              {
                sub_1DCB47160((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v23);
                array[j] = *(double *)(v24 + 8 * j);
              }
            }
            goto LABEL_32;
          }
          if ((sub_1DCBD8894((pxrInternal__aapl__pxrReserved__::VtValue *)&v26) & 1) != 0
            || (v14 = sub_1DCBD86EC((pxrInternal__aapl__pxrReserved__::VtValue *)&v26), sub_1DCB9AD14(&v26, v14), v27))
          {
            v15 = (__int128 *)sub_1DCBD8774((pxrInternal__aapl__pxrReserved__::VtValue *)&v26);
            sub_1DCBD87DC((uint64_t)v21, v15);
            v16 = *(_QWORD *)&v23[0];
            if (*(_QWORD *)&v21[0] < *(_QWORD *)&v23[0])
              v16 = *(_QWORD *)&v21[0];
            if (v16 < v5)
              v5 = v16;
            if (v5)
            {
              v17 = 0;
              v18 = fmax(fmin((time - v28) / (v25 - v28), 1.0), 0.0);
              do
              {
                sub_1DCB47160((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v23);
                v19 = *(double *)(v24 + 8 * v17);
                sub_1DCB47160((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v21);
                array[v17] = v19 + (*(double *)(v22 + 8 * v17) - v19) * v18;
                ++v17;
              }
              while (v5 != v17);
            }
            goto LABEL_32;
          }
        }
      }
    }
    v5 = 0;
LABEL_32:
    sub_1DCAEEE78((uint64_t)v21);
    sub_1DCAEEE78((uint64_t)v23);
    sub_1DCAEEE2C((uint64_t)&v26);
    sub_1DCAEEE2C((uint64_t)&v29);
    return v5;
  }
  NSLog(CFSTR("array count (%lu) has to match MDLAnimatedScalarArray.elementCount (%lu)"), a2, array, time, maxCount, elementCount);
  return 0;
}

- (void)resetWithFloatArray:(const float *)valuesArray count:(NSUInteger)valuesCount atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)timesCount
{
  unint64_t elementCount;
  TimeSampledVtValue *end;
  uint64_t *p_timeSampledData;
  TimeSampledVtValue *begin;
  TimeSampledVtValue *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  float v17;
  _OWORD v19[2];
  uint64_t v20;
  NSTimeInterval v21;
  uint64_t v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  elementCount = self->_elementCount;
  if (elementCount * timesCount == valuesCount)
  {
    begin = self->super._timeSampledData.__begin_;
    end = self->super._timeSampledData.__end_;
    p_timeSampledData = (uint64_t *)&self->super._timeSampledData;
    if (end != begin)
    {
      do
      {
        v13 = (TimeSampledVtValue *)((char *)end - 24);
        sub_1DCAEEE2C((uint64_t)end - 16);
        end = v13;
      }
      while (v13 != begin);
      LODWORD(elementCount) = self->_elementCount;
    }
    self->super._timeSampledData.__end_ = begin;
    v20 = 0;
    memset(v19, 0, sizeof(v19));
    sub_1DCB43828((uint64_t)v19, elementCount);
    if (timesCount)
    {
      v14 = 0;
      v15 = 0;
      do
      {
        if (self->_elementCount)
        {
          v16 = 0;
          do
          {
            v17 = valuesArray[v15 + v16];
            sub_1DCB30E20((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v19);
            *(float *)(v20 + 4 * v16++) = v17;
          }
          while (v16 < self->_elementCount);
          v15 += v16;
        }
        v21 = timesArray[v14];
        v22[1] = (uint64_t)&off_1EA575D30;
        sub_1DCB46DC8(v22, (uint64_t)v19);
        sub_1DCBD733C(p_timeSampledData, &v21);
        sub_1DCAEEE2C((uint64_t)v22);
        ++v14;
      }
      while (v14 != timesCount);
    }
    sub_1DCAEEE78((uint64_t)v19);
  }
  else
  {
    NSLog(CFSTR("value array count mismatch: expected %lu * %lu = %lu elements, but got %lu"), a2, timesCount, elementCount, elementCount * timesCount, valuesCount);
  }
}

- (void)resetWithDoubleArray:(const double *)valuesArray count:(NSUInteger)valuesCount atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)timesCount
{
  unint64_t elementCount;
  TimeSampledVtValue *end;
  uint64_t *p_timeSampledData;
  TimeSampledVtValue *begin;
  TimeSampledVtValue *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  double v17;
  _OWORD v19[2];
  uint64_t v20;
  NSTimeInterval v21;
  uint64_t v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  elementCount = self->_elementCount;
  if (elementCount * timesCount == valuesCount)
  {
    begin = self->super._timeSampledData.__begin_;
    end = self->super._timeSampledData.__end_;
    p_timeSampledData = (uint64_t *)&self->super._timeSampledData;
    if (end != begin)
    {
      do
      {
        v13 = (TimeSampledVtValue *)((char *)end - 24);
        sub_1DCAEEE2C((uint64_t)end - 16);
        end = v13;
      }
      while (v13 != begin);
      LODWORD(elementCount) = self->_elementCount;
    }
    self->super._timeSampledData.__end_ = begin;
    v20 = 0;
    memset(v19, 0, sizeof(v19));
    sub_1DCB43FBC((uint64_t)v19, elementCount);
    if (timesCount)
    {
      v14 = 0;
      v15 = 0;
      do
      {
        if (self->_elementCount)
        {
          v16 = 0;
          do
          {
            v17 = valuesArray[v15 + v16];
            sub_1DCB47160((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v19);
            *(double *)(v20 + 8 * v16++) = v17;
          }
          while (v16 < self->_elementCount);
          v15 += v16;
        }
        v21 = timesArray[v14];
        v22[1] = (uint64_t)&off_1EA575C78;
        sub_1DCB46DC8(v22, (uint64_t)v19);
        sub_1DCBD733C(p_timeSampledData, &v21);
        sub_1DCAEEE2C((uint64_t)v22);
        ++v14;
      }
      while (v14 != timesCount);
    }
    sub_1DCAEEE78((uint64_t)v19);
  }
  else
  {
    NSLog(CFSTR("value array count mismatch: expected %lu * %lu = %lu elements, but got %lu"), a2, timesCount, elementCount, elementCount * timesCount, valuesCount);
  }
}

- (NSUInteger)getFloatArray:(float *)valuesArray maxCount:(NSUInteger)maxCount
{
  TimeSampledVtValue *end;
  TimeSampledVtValue *begin;
  unint64_t v7;
  NSUInteger result;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t *v13;
  std::type_info *v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  begin = self->super._timeSampledData.__begin_;
  end = self->super._timeSampledData.__end_;
  v7 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
  result = v7 * self->_elementCount;
  if (result <= maxCount)
  {
    if (end != begin)
    {
      v10 = 0;
      v11 = 0;
      v21 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
      if (v7 <= 1)
        v12 = 1;
      else
        v12 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
      do
      {
        v25 = 0;
        v26[0] = 0;
        v26[1] = 0;
        v13 = (uint64_t *)((char *)self->super._timeSampledData.__begin_ + 24 * v10);
        v25 = *v13;
        sub_1DCB25EEC(v26, v13 + 1);
        if ((sub_1DCB44F28((pxrInternal__aapl__pxrReserved__::VtValue *)v26) & 1) == 0)
        {
          v14 = sub_1DCBD8360((pxrInternal__aapl__pxrReserved__::VtValue *)v26);
          sub_1DCB9AD14(v26, v14);
        }
        if (sub_1DCB44F28((pxrInternal__aapl__pxrReserved__::VtValue *)v26))
        {
          v24 = 0;
          v22 = 0u;
          v23 = 0u;
          v15 = sub_1DCB41744((pxrInternal__aapl__pxrReserved__::VtValue *)v26);
          v16 = *(_OWORD *)(v15 + 16);
          v22 = *(_OWORD *)v15;
          v23 = v16;
          v17 = *(_QWORD *)(v15 + 32);
          v24 = v17;
          if (v17)
          {
            v18 = (unint64_t *)(v17 - 16);
            if (*((_QWORD *)&v23 + 1))
              v18 = (unint64_t *)*((_QWORD *)&v23 + 1);
            do
              v19 = __ldxr(v18);
            while (__stxr(v19 + 1, v18));
          }
          if (self->_elementCount)
          {
            v20 = 0;
            do
            {
              sub_1DCB30E20((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v22);
              valuesArray[v11 + v20] = *(float *)(v24 + 4 * v20);
              ++v20;
            }
            while (v20 < self->_elementCount);
            v11 += v20;
          }
          sub_1DCAEEE78((uint64_t)&v22);
        }
        sub_1DCAEEE2C((uint64_t)v26);
        ++v10;
      }
      while (v10 != v12);
      return self->_elementCount * v21;
    }
  }
  else
  {
    NSLog(CFSTR("valuesArray size is too small (%lu elements) to hold all %lu elements"), a2, valuesArray, maxCount, result);
    return 0;
  }
  return result;
}

- (NSUInteger)getDoubleArray:(double *)valuesArray maxCount:(NSUInteger)maxCount
{
  TimeSampledVtValue *end;
  TimeSampledVtValue *begin;
  unint64_t v7;
  NSUInteger result;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t *v13;
  std::type_info *v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  begin = self->super._timeSampledData.__begin_;
  end = self->super._timeSampledData.__end_;
  v7 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
  result = v7 * self->_elementCount;
  if (result <= maxCount)
  {
    if (end != begin)
    {
      v10 = 0;
      v11 = 0;
      v21 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
      if (v7 <= 1)
        v12 = 1;
      else
        v12 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
      do
      {
        v25 = 0;
        v26[0] = 0;
        v26[1] = 0;
        v13 = (uint64_t *)((char *)self->super._timeSampledData.__begin_ + 24 * v10);
        v25 = *v13;
        sub_1DCB25EEC(v26, v13 + 1);
        if ((sub_1DCBD6DF8((pxrInternal__aapl__pxrReserved__::VtValue *)v26) & 1) == 0)
        {
          v14 = sub_1DCBD86EC((pxrInternal__aapl__pxrReserved__::VtValue *)v26);
          sub_1DCB9AD14(v26, v14);
        }
        if (sub_1DCBD6DF8((pxrInternal__aapl__pxrReserved__::VtValue *)v26))
        {
          v24 = 0;
          v22 = 0u;
          v23 = 0u;
          v15 = sub_1DCBD8774((pxrInternal__aapl__pxrReserved__::VtValue *)v26);
          v16 = *(_OWORD *)(v15 + 16);
          v22 = *(_OWORD *)v15;
          v23 = v16;
          v17 = *(_QWORD *)(v15 + 32);
          v24 = v17;
          if (v17)
          {
            v18 = (unint64_t *)(v17 - 16);
            if (*((_QWORD *)&v23 + 1))
              v18 = (unint64_t *)*((_QWORD *)&v23 + 1);
            do
              v19 = __ldxr(v18);
            while (__stxr(v19 + 1, v18));
          }
          if (self->_elementCount)
          {
            v20 = 0;
            do
            {
              sub_1DCB47160((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v22);
              valuesArray[v11 + v20] = *(double *)(v24 + 8 * v20);
              ++v20;
            }
            while (v20 < self->_elementCount);
            v11 += v20;
          }
          sub_1DCAEEE78((uint64_t)&v22);
        }
        sub_1DCAEEE2C((uint64_t)v26);
        ++v10;
      }
      while (v10 != v12);
      return self->_elementCount * v21;
    }
  }
  else
  {
    NSLog(CFSTR("valuesArray size is too small (%lu elements) to hold all %lu elements"), a2, valuesArray, maxCount, result);
    return 0;
  }
  return result;
}

- (void)setElementCount:(unint64_t)a3
{
  self->_elementCount = a3;
}

@end
