@implementation MDLAnimatedQuaternionArray

- (id)initWithElementCount:(NSUInteger)arrayElementCount
{
  MDLAnimatedQuaternionArray *v4;
  MDLAnimatedQuaternionArray *v5;
  MDLAnimatedQuaternionArray *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MDLAnimatedQuaternionArray;
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
  v5.super_class = (Class)MDLAnimatedQuaternionArray;
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
  if ((sub_1DCBDB054((pxrInternal__aapl__pxrReserved__::VtValue *)v5) & 1) != 0
    || (sub_1DCBDB08C((pxrInternal__aapl__pxrReserved__::VtValue *)v5) & 1) != 0)
  {
    sub_1DCAEEE2C((uint64_t)v5);
    return 1;
  }
  v4 = sub_1DCBDB0C4((pxrInternal__aapl__pxrReserved__::VtValue *)v5);
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
  if (!sub_1DCBDB08C((pxrInternal__aapl__pxrReserved__::VtValue *)v6))
  {
    if (sub_1DCBDB054((pxrInternal__aapl__pxrReserved__::VtValue *)v6))
    {
      sub_1DCBDB318((uint64_t)v5, 0);
      v3[1] = (uint64_t)&off_1EA5756B8;
      sub_1DCB272BC(v3, (uint64_t)v5);
      sub_1DCAEEE78((uint64_t)v5);
      goto LABEL_8;
    }
    if (sub_1DCBDB0C4((pxrInternal__aapl__pxrReserved__::VtValue *)v6))
    {
      sub_1DCBDB384((uint64_t)v5, 0);
      v3[1] = (uint64_t)&off_1EA575600;
      sub_1DCB272BC(v3, (uint64_t)v5);
      sub_1DCAEEE78((uint64_t)v5);
      goto LABEL_8;
    }
    self = (MDLAnimatedQuaternionArray *)sub_1DCAEEE2C((uint64_t)v6);
LABEL_10:
    v3[1] = 0;
    goto LABEL_11;
  }
  sub_1DCBDB2AC((uint64_t)v5, 0);
  v3[1] = (uint64_t)&off_1EA575770;
  sub_1DCB272BC(v3, (uint64_t)v5);
  sub_1DCAEEE78((uint64_t)v5);
LABEL_8:
  self = (MDLAnimatedQuaternionArray *)sub_1DCAEEE2C((uint64_t)v6);
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
  if ((sub_1DCBDB08C((pxrInternal__aapl__pxrReserved__::VtValue *)v10) & 1) != 0
    || (sub_1DCBDB054((pxrInternal__aapl__pxrReserved__::VtValue *)v10) & 1) != 0
    || sub_1DCBDB0C4((pxrInternal__aapl__pxrReserved__::VtValue *)v10))
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
  if ((sub_1DCBDB08C((pxrInternal__aapl__pxrReserved__::VtValue *)v10) & 1) != 0
    || (sub_1DCBDB054((pxrInternal__aapl__pxrReserved__::VtValue *)v10) & 1) != 0
    || sub_1DCBDB0C4((pxrInternal__aapl__pxrReserved__::VtValue *)v10))
  {
    v8 = a5 * a4;
    sub_1DCB25EEC(v9, v10);
    sub_1DCBD733C((uint64_t *)&self->super._timeSampledData, &v8);
    sub_1DCAEEE2C((uint64_t)v9);
  }
  sub_1DCAEEE2C((uint64_t)v10);
}

- (void)setFloatQuaternionArray:(const simd_quatf *)array count:(NSUInteger)count atTime:(NSTimeInterval)time
{
  unint64_t elementCount;
  uint64_t v10;
  TimeSampledVtValue *begin;
  const char *v12;
  uint64_t v13;
  pxrInternal__aapl__pxrReserved__::VtValue *Typeid;
  pxrInternal__aapl__pxrReserved__::VtValue *v15;
  simd_quatf v16;
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
    sub_1DCBDB318((uint64_t)v17, count);
    if (count)
    {
      v10 = 0;
      do
      {
        v16 = array[v10];
        sub_1DCBE7780((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v17);
        *(simd_quatf *)(v18 + 16 * v10++) = v16;
      }
      while (count != v10);
    }
    v22[0] = 0;
    v22[1] = (uint64_t)&off_1EA5756B8;
    sub_1DCB272BC(v22, (uint64_t)v17);
    begin = self->super._timeSampledData.__begin_;
    if (self->super._timeSampledData.__end_ != begin)
    {
      v19 = 0.0;
      v20[0] = 0;
      sub_1DCB25EEC(&v19, (_QWORD *)begin + 1);
      if ((sub_1DCBDB054((pxrInternal__aapl__pxrReserved__::VtValue *)&v19) & 1) == 0)
      {
        objc_msgSend_defaultVtValue(self, v12, v13);
        Typeid = (pxrInternal__aapl__pxrReserved__::VtValue *)pxrInternal__aapl__pxrReserved__::VtValue::GetTypeid((pxrInternal__aapl__pxrReserved__::VtValue *)v21);
        v15 = sub_1DCBE446C((pxrInternal__aapl__pxrReserved__::VtValue *)v22, Typeid);
        sub_1DCB9AD14(v22, v15);
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
    NSLog(CFSTR("array count (%lu) has to match MDLAnimatedQuaternionArray.elementCount (%lu)"), a2, array, time, count, elementCount);
  }
}

- (void)setDoubleQuaternionArray:(const simd_quatd *)array count:(NSUInteger)count atTime:(NSTimeInterval)time
{
  NSUInteger v5;
  unint64_t elementCount;
  uint64_t v10;
  _OWORD *v11;
  TimeSampledVtValue *begin;
  const char *v13;
  uint64_t v14;
  pxrInternal__aapl__pxrReserved__::VtValue *Typeid;
  pxrInternal__aapl__pxrReserved__::VtValue *v16;
  __int128 v17;
  __int128 v18;
  _OWORD v19[2];
  uint64_t v20;
  NSTimeInterval v21;
  _QWORD v22[2];
  _BYTE v23[16];
  uint64_t v24[3];

  v5 = count;
  v24[2] = *MEMORY[0x1E0C80C00];
  elementCount = self->_elementCount;
  if (elementCount == count)
  {
    v20 = 0;
    memset(v19, 0, sizeof(v19));
    sub_1DCBDB384((uint64_t)v19, count);
    if (v5)
    {
      v10 = 0;
      do
      {
        v17 = *(_OWORD *)array[v10].vector.f64;
        v18 = *(_OWORD *)&array[v10].vector.f64[2];
        sub_1DCBE7814((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v19);
        v11 = (_OWORD *)(v20 + v10 * 32);
        *v11 = v17;
        v11[1] = v18;
        ++v10;
        --v5;
      }
      while (v5);
    }
    v24[0] = 0;
    v24[1] = (uint64_t)&off_1EA575600;
    sub_1DCB272BC(v24, (uint64_t)v19);
    begin = self->super._timeSampledData.__begin_;
    if (self->super._timeSampledData.__end_ != begin)
    {
      v21 = 0.0;
      v22[0] = 0;
      sub_1DCB25EEC(&v21, (_QWORD *)begin + 1);
      if ((sub_1DCBDB0C4((pxrInternal__aapl__pxrReserved__::VtValue *)&v21) & 1) == 0)
      {
        objc_msgSend_defaultVtValue(self, v13, v14);
        Typeid = (pxrInternal__aapl__pxrReserved__::VtValue *)pxrInternal__aapl__pxrReserved__::VtValue::GetTypeid((pxrInternal__aapl__pxrReserved__::VtValue *)v23);
        v16 = sub_1DCBE446C((pxrInternal__aapl__pxrReserved__::VtValue *)v24, Typeid);
        sub_1DCB9AD14(v24, v16);
        sub_1DCAEEE2C((uint64_t)v23);
      }
      sub_1DCAEEE2C((uint64_t)&v21);
    }
    v21 = time;
    sub_1DCB25EEC(v22, v24);
    sub_1DCBD7754((uint64_t *)&self->super._timeSampledData, &v21);
    sub_1DCAEEE2C((uint64_t)v22);
    sub_1DCAEEE2C((uint64_t)v24);
    sub_1DCAEEE78((uint64_t)v19);
  }
  else
  {
    NSLog(CFSTR("array count (%lu) has to match MDLAnimatedQuaternionArray.elementCount (%lu)"), a2, array, time, count, elementCount);
  }
}

- (NSUInteger)getFloatQuaternionArray:(simd_quatf *)array maxCount:(NSUInteger)maxCount atTime:(NSTimeInterval)time
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
  float32x4_t v20;
  float v21;
  float32x4_t v22;
  _OWORD v23[2];
  uint64_t v24;
  _OWORD v25[2];
  uint64_t v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v5 = maxCount;
  v33 = *MEMORY[0x1E0C80C00];
  elementCount = self->_elementCount;
  if (elementCount <= maxCount)
  {
    v30 = 0.0;
    v31 = 0;
    v32 = 0;
    v27 = 0.0;
    v28 = 0;
    v29 = 0;
    v26 = 0;
    memset(v25, 0, sizeof(v25));
    v24 = 0;
    memset(v23, 0, sizeof(v23));
    sub_1DCBD8170((double **)&self->super._timeSampledData, (uint64_t)&v30, (uint64_t)&v27, time);
    if (v32)
    {
      if ((sub_1DCBDB054((pxrInternal__aapl__pxrReserved__::VtValue *)&v31) & 1) != 0
        || (v10 = sub_1DCBDBE9C((pxrInternal__aapl__pxrReserved__::VtValue *)&v31), sub_1DCB9AD14(&v31, v10), v32))
      {
        v11 = (__int128 *)sub_1DCBDBF24((pxrInternal__aapl__pxrReserved__::VtValue *)&v31);
        sub_1DCBDBF8C((uint64_t)v25, v11);
        if (!self->super._interpolation)
        {
          if (*(_QWORD *)&v25[0] < v5)
            v5 = *(_QWORD *)&v25[0];
          if (v5)
          {
            for (i = 0; i != v5; ++i)
            {
              sub_1DCBE7780((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v25);
              array[i] = *(simd_quatf *)(v26 + 16 * i);
            }
          }
          goto LABEL_32;
        }
        if (v29)
        {
          if (v30 == v27)
          {
            if (*(_QWORD *)&v25[0] < v5)
              v5 = *(_QWORD *)&v25[0];
            if (v5)
            {
              for (j = 0; j != v5; ++j)
              {
                sub_1DCBE7780((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v25);
                array[j] = *(simd_quatf *)(v26 + 16 * j);
              }
            }
            goto LABEL_32;
          }
          if ((sub_1DCBDC044((pxrInternal__aapl__pxrReserved__::VtValue *)&v28) & 1) != 0
            || (v14 = sub_1DCBDBE9C((pxrInternal__aapl__pxrReserved__::VtValue *)&v28), sub_1DCB9AD14(&v28, v14), v29))
          {
            v15 = (__int128 *)sub_1DCBDBF24((pxrInternal__aapl__pxrReserved__::VtValue *)&v28);
            sub_1DCBDBF8C((uint64_t)v23, v15);
            v16 = *(_QWORD *)&v25[0];
            if (*(_QWORD *)&v23[0] < *(_QWORD *)&v25[0])
              v16 = *(_QWORD *)&v23[0];
            if (v16 < v5)
              v5 = v16;
            if (v5)
            {
              v17 = 0;
              v18 = fmax(fmin((time - v30) / (v27 - v30), 1.0), 0.0);
              *(float *)&v18 = v18;
              v20 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v18, 0);
              v21 = 1.0 - *(float *)&v18;
              do
              {
                sub_1DCBE7780((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v25);
                v22 = *(float32x4_t *)(v26 + 16 * v17);
                sub_1DCBE7780((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v23);
                array[v17] = (simd_quatf)vmlaq_f32(vmulq_n_f32(v22, v21), v20, *(float32x4_t *)(v24 + 16 * v17));
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
    sub_1DCAEEE78((uint64_t)v23);
    sub_1DCAEEE78((uint64_t)v25);
    sub_1DCAEEE2C((uint64_t)&v28);
    sub_1DCAEEE2C((uint64_t)&v31);
    return v5;
  }
  NSLog(CFSTR("array count (%lu) has to match MDLAnimatedQuaternionArray.elementCount (%lu)"), a2, array, time, maxCount, elementCount);
  return 0;
}

- (NSUInteger)getDoubleQuaternionArray:(simd_quatd *)array maxCount:(NSUInteger)maxCount atTime:(NSTimeInterval)time
{
  NSUInteger v5;
  NSUInteger elementCount;
  std::type_info *v10;
  __int128 *v11;
  uint64_t v12;
  NSUInteger v13;
  __int128 v14;
  simd_quatd *v15;
  uint64_t v16;
  NSUInteger v17;
  __int128 v18;
  simd_quatd *v19;
  std::type_info *v20;
  __int128 *v21;
  NSUInteger v22;
  unint64_t v23;
  double v24;
  NSUInteger v25;
  float64x2_t v26;
  float64x2_t v27;
  float64x2_t v28;
  simd_quatd *v29;
  float64x2_t v30;
  float64_t v32;
  float64x2_t v33;
  float64_t v34;
  float64x2_t v35[2];
  float64x2_t v36[2];
  float64x2_t v37[2];
  _OWORD v38[2];
  uint64_t v39;
  _OWORD v40[2];
  uint64_t v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v5 = maxCount;
  v48 = *MEMORY[0x1E0C80C00];
  elementCount = self->_elementCount;
  if (elementCount <= maxCount)
  {
    v45 = 0.0;
    v46 = 0;
    v47 = 0;
    v42 = 0.0;
    v43 = 0;
    v44 = 0;
    v41 = 0;
    memset(v40, 0, sizeof(v40));
    v39 = 0;
    memset(v38, 0, sizeof(v38));
    sub_1DCBD8170((double **)&self->super._timeSampledData, (uint64_t)&v45, (uint64_t)&v42, time);
    if (v47)
    {
      if ((sub_1DCBDB0C4((pxrInternal__aapl__pxrReserved__::VtValue *)&v46) & 1) != 0
        || (v10 = sub_1DCBDC410((pxrInternal__aapl__pxrReserved__::VtValue *)&v46), sub_1DCB9AD14(&v46, v10), v47))
      {
        v11 = (__int128 *)sub_1DCBDC498((pxrInternal__aapl__pxrReserved__::VtValue *)&v46);
        sub_1DCBDC500((uint64_t)v40, v11);
        if (!self->super._interpolation)
        {
          if (*(_QWORD *)&v40[0] < v5)
            v5 = *(_QWORD *)&v40[0];
          if (v5)
          {
            v16 = 0;
            v17 = v5;
            do
            {
              sub_1DCBE7814((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v40);
              v18 = *(_OWORD *)(v41 + v16 * 32 + 16);
              v19 = &array[v16];
              *(_OWORD *)v19->vector.f64 = *(_OWORD *)(v41 + v16 * 32);
              *(_OWORD *)&v19->vector.f64[2] = v18;
              ++v16;
              --v17;
            }
            while (v17);
          }
          goto LABEL_32;
        }
        if (v44)
        {
          if (v45 == v42)
          {
            if (*(_QWORD *)&v40[0] < v5)
              v5 = *(_QWORD *)&v40[0];
            if (v5)
            {
              v12 = 0;
              v13 = v5;
              do
              {
                sub_1DCBE7814((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v40);
                v14 = *(_OWORD *)(v41 + v12 * 32 + 16);
                v15 = &array[v12];
                *(_OWORD *)v15->vector.f64 = *(_OWORD *)(v41 + v12 * 32);
                *(_OWORD *)&v15->vector.f64[2] = v14;
                ++v12;
                --v13;
              }
              while (v13);
            }
            goto LABEL_32;
          }
          if ((sub_1DCBDC5B8((pxrInternal__aapl__pxrReserved__::VtValue *)&v43) & 1) != 0
            || (v20 = sub_1DCBDC410((pxrInternal__aapl__pxrReserved__::VtValue *)&v43), sub_1DCB9AD14(&v43, v20), v44))
          {
            v21 = (__int128 *)sub_1DCBDC498((pxrInternal__aapl__pxrReserved__::VtValue *)&v43);
            sub_1DCBDC500((uint64_t)v38, v21);
            v22 = *(_QWORD *)&v40[0];
            if (*(_QWORD *)&v38[0] < *(_QWORD *)&v40[0])
              v22 = *(_QWORD *)&v38[0];
            if (v22 < v5)
              v5 = v22;
            if (v5)
            {
              v23 = 0;
              v24 = fmax(fmin((time - v45) / (v42 - v45), 1.0), 0.0);
              v25 = v5;
              do
              {
                sub_1DCBE7814((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v40);
                v34 = *(double *)(v41 + v23);
                v32 = *(double *)(v41 + v23 + 8);
                v33 = *(float64x2_t *)(v41 + v23 + 16);
                sub_1DCBE7814((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v38);
                v26.f64[0] = v34;
                v26.f64[1] = v32;
                v27 = *(float64x2_t *)(v39 + v23);
                v28 = *(float64x2_t *)(v39 + v23 + 16);
                v36[0] = v26;
                v36[1] = v33;
                v35[0] = v27;
                v35[1] = v28;
                sub_1DCBDC5F0(v36, v35, v37, v24);
                v29 = &array[v23 / 0x20];
                v30 = v37[1];
                *(float64x2_t *)v29->vector.f64 = v37[0];
                *(float64x2_t *)&v29->vector.f64[2] = v30;
                v23 += 32;
                --v25;
              }
              while (v25);
            }
            goto LABEL_32;
          }
        }
      }
    }
    v5 = 0;
LABEL_32:
    sub_1DCAEEE78((uint64_t)v38);
    sub_1DCAEEE78((uint64_t)v40);
    sub_1DCAEEE2C((uint64_t)&v43);
    sub_1DCAEEE2C((uint64_t)&v46);
    return v5;
  }
  NSLog(CFSTR("array count (%lu) has to match MDLAnimatedQuaternionArray.elementCount (%lu)"), a2, array, time, maxCount, elementCount);
  return 0;
}

- (void)resetWithFloatQuaternionArray:(const simd_quatf *)valuesArray count:(NSUInteger)valuesCount atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)timesCount
{
  unint64_t elementCount;
  TimeSampledVtValue *end;
  uint64_t *p_timeSampledData;
  TimeSampledVtValue *begin;
  TimeSampledVtValue *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  simd_quatf v18;
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
    sub_1DCBDB318((uint64_t)v19, elementCount);
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
            v18 = valuesArray[v14 + v16];
            sub_1DCBE7780((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v19);
            *(simd_quatf *)(v20 + 16 * v16++) = v18;
          }
          while (v16 < self->_elementCount);
          v14 += v16;
        }
        v21 = timesArray[v15];
        v22[1] = (uint64_t)&off_1EA5756B8;
        sub_1DCB272BC(v22, (uint64_t)v19);
        sub_1DCBD733C(p_timeSampledData, &v21);
        sub_1DCAEEE2C((uint64_t)v22);
        ++v15;
      }
      while (v15 != timesCount);
    }
    sub_1DCAEEE78((uint64_t)v19);
  }
  else
  {
    NSLog(CFSTR("value array count mismatch: expected %lu * %lu = %lu elements, but got %lu"), a2, timesCount, elementCount, elementCount * timesCount, valuesCount);
  }
}

- (void)resetWithDoubleQuaternionArray:(const simd_quatd *)valuesArray count:(NSUInteger)valuesCount atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)timesCount
{
  unint64_t elementCount;
  TimeSampledVtValue *end;
  TimeSampledVtValue *begin;
  uint64_t *p_timeSampledData;
  TimeSampledVtValue *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  const simd_quatd *v17;
  _OWORD *v18;
  __int128 v21;
  __int128 v22;
  _OWORD v23[2];
  uint64_t v24;
  NSTimeInterval v25;
  uint64_t v26[4];

  v26[2] = *MEMORY[0x1E0C80C00];
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
        v12 = (TimeSampledVtValue *)((char *)end - 24);
        sub_1DCAEEE2C((uint64_t)end - 16);
        end = v12;
      }
      while (v12 != begin);
      LODWORD(elementCount) = self->_elementCount;
    }
    self->super._timeSampledData.__end_ = begin;
    v24 = 0;
    memset(v23, 0, sizeof(v23));
    sub_1DCBDB384((uint64_t)v23, elementCount);
    if (timesCount)
    {
      v13 = 0;
      v14 = 0;
      do
      {
        if (self->_elementCount)
        {
          v15 = 0;
          v16 = 0;
          v17 = &valuesArray[v13];
          do
          {
            v21 = *(_OWORD *)v17[v15].vector.f64;
            v22 = *(_OWORD *)&v17[v15].vector.f64[2];
            sub_1DCBE7814((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v23);
            v18 = (_OWORD *)(v24 + v15 * 32);
            *v18 = v21;
            v18[1] = v22;
            ++v16;
            ++v15;
          }
          while (v16 < self->_elementCount);
          v13 += v16;
        }
        v25 = timesArray[v14];
        v26[1] = (uint64_t)&off_1EA575600;
        sub_1DCB272BC(v26, (uint64_t)v23);
        sub_1DCBD733C(p_timeSampledData, &v25);
        sub_1DCAEEE2C((uint64_t)v26);
        ++v14;
      }
      while (v14 != timesCount);
    }
    sub_1DCAEEE78((uint64_t)v23);
  }
  else
  {
    NSLog(CFSTR("value array count mismatch: expected %lu * %lu = %lu elements, but got %lu"), a2, timesCount, elementCount, elementCount * timesCount, valuesCount);
  }
}

- (NSUInteger)getFloatQuaternionArray:(simd_quatf *)valuesArray maxCount:(NSUInteger)maxCount
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
        if ((sub_1DCBDB054((pxrInternal__aapl__pxrReserved__::VtValue *)v26) & 1) == 0)
        {
          v14 = sub_1DCBDBE9C((pxrInternal__aapl__pxrReserved__::VtValue *)v26);
          sub_1DCB9AD14(v26, v14);
        }
        if (sub_1DCBDB054((pxrInternal__aapl__pxrReserved__::VtValue *)v26))
        {
          v24 = 0;
          v22 = 0u;
          v23 = 0u;
          v15 = sub_1DCBDBF24((pxrInternal__aapl__pxrReserved__::VtValue *)v26);
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
              sub_1DCBE7780((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v22);
              valuesArray[v11 + v20] = *(simd_quatf *)(v24 + 16 * v20);
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

- (NSUInteger)getDoubleQuaternionArray:(simd_quatd *)valuesArray maxCount:(NSUInteger)maxCount
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
  __int128 *v21;
  __int128 v22;
  __int128 v23;
  simd_quatd *v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
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
      if (v7 <= 1)
        v12 = 1;
      else
        v12 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
      do
      {
        v28 = 0;
        v29[0] = 0;
        v29[1] = 0;
        v13 = (uint64_t *)((char *)self->super._timeSampledData.__begin_ + 24 * v10);
        v28 = *v13;
        sub_1DCB25EEC(v29, v13 + 1);
        if ((sub_1DCBDB0C4((pxrInternal__aapl__pxrReserved__::VtValue *)v29) & 1) == 0)
        {
          v14 = sub_1DCBDC410((pxrInternal__aapl__pxrReserved__::VtValue *)v29);
          sub_1DCB9AD14(v29, v14);
        }
        if (sub_1DCBDB0C4((pxrInternal__aapl__pxrReserved__::VtValue *)v29))
        {
          v27 = 0;
          v25 = 0u;
          v26 = 0u;
          v15 = sub_1DCBDC498((pxrInternal__aapl__pxrReserved__::VtValue *)v29);
          v16 = *(_OWORD *)(v15 + 16);
          v25 = *(_OWORD *)v15;
          v26 = v16;
          v17 = *(_QWORD *)(v15 + 32);
          v27 = v17;
          if (v17)
          {
            v18 = (unint64_t *)(v17 - 16);
            if (*((_QWORD *)&v26 + 1))
              v18 = (unint64_t *)*((_QWORD *)&v26 + 1);
            do
              v19 = __ldxr(v18);
            while (__stxr(v19 + 1, v18));
          }
          if (self->_elementCount)
          {
            v20 = 0;
            do
            {
              sub_1DCBE7814((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v25);
              v21 = (__int128 *)(v27 + 32 * v20);
              v22 = *v21;
              v23 = v21[1];
              v24 = &valuesArray[v11];
              *(_OWORD *)v24->vector.f64 = v22;
              *(_OWORD *)&v24->vector.f64[2] = v23;
              ++v11;
              ++v20;
            }
            while (v20 < self->_elementCount);
          }
          sub_1DCAEEE78((uint64_t)&v25);
        }
        sub_1DCAEEE2C((uint64_t)v29);
        ++v10;
      }
      while (v10 != v12);
      return self->_elementCount * v7;
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
