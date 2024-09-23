@implementation MDLAnimatedVector3Array

- (id)initWithElementCount:(NSUInteger)arrayElementCount
{
  MDLAnimatedVector3Array *v4;
  MDLAnimatedVector3Array *v5;
  MDLAnimatedVector3Array *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MDLAnimatedVector3Array;
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
  v5.super_class = (Class)MDLAnimatedVector3Array;
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
  if ((sub_1DCB26964((pxrInternal__aapl__pxrReserved__::VtValue *)v5) & 1) != 0
    || (sub_1DCBD9264((pxrInternal__aapl__pxrReserved__::VtValue *)v5) & 1) != 0)
  {
    sub_1DCAEEE2C((uint64_t)v5);
    return 1;
  }
  v4 = sub_1DCBD929C((pxrInternal__aapl__pxrReserved__::VtValue *)v5);
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
  if (!sub_1DCBD9264((pxrInternal__aapl__pxrReserved__::VtValue *)v6))
  {
    if (sub_1DCB26964((pxrInternal__aapl__pxrReserved__::VtValue *)v6))
    {
      sub_1DCB2525C((uint64_t)v5, 0);
      v3[1] = (uint64_t)&off_1EA575998;
      sub_1DCB272BC(v3, (uint64_t)v5);
      sub_1DCAEEE78((uint64_t)v5);
      goto LABEL_8;
    }
    if (sub_1DCBD929C((pxrInternal__aapl__pxrReserved__::VtValue *)v6))
    {
      sub_1DCBD94F8((uint64_t)v5, 0);
      v3[1] = (uint64_t)&off_1EA5758E0;
      sub_1DCB272BC(v3, (uint64_t)v5);
      sub_1DCAEEE78((uint64_t)v5);
      goto LABEL_8;
    }
    self = (MDLAnimatedVector3Array *)sub_1DCAEEE2C((uint64_t)v6);
LABEL_10:
    v3[1] = 0;
    goto LABEL_11;
  }
  sub_1DCBD9484((uint64_t)v5, 0);
  v3[1] = (uint64_t)&off_1EA575A50;
  sub_1DCB272BC(v3, (uint64_t)v5);
  sub_1DCAEEE78((uint64_t)v5);
LABEL_8:
  self = (MDLAnimatedVector3Array *)sub_1DCAEEE2C((uint64_t)v6);
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
  if ((sub_1DCBD9264((pxrInternal__aapl__pxrReserved__::VtValue *)v10) & 1) != 0
    || (sub_1DCB26964((pxrInternal__aapl__pxrReserved__::VtValue *)v10) & 1) != 0
    || sub_1DCBD929C((pxrInternal__aapl__pxrReserved__::VtValue *)v10))
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
  if ((sub_1DCBD9264((pxrInternal__aapl__pxrReserved__::VtValue *)v10) & 1) != 0
    || (sub_1DCB26964((pxrInternal__aapl__pxrReserved__::VtValue *)v10) & 1) != 0
    || sub_1DCBD929C((pxrInternal__aapl__pxrReserved__::VtValue *)v10))
  {
    v8 = a5 * a4;
    sub_1DCB25EEC(v9, v10);
    sub_1DCBD733C((uint64_t *)&self->super._timeSampledData, &v8);
    sub_1DCAEEE2C((uint64_t)v9);
  }
  sub_1DCAEEE2C((uint64_t)v10);
}

- (void)setFloat3Array:(const vector_float3 *)array count:(NSUInteger)count atTime:(NSTimeInterval)time
{
  NSUInteger v5;
  unint64_t elementCount;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  TimeSampledVtValue *begin;
  const char *v16;
  uint64_t v17;
  pxrInternal__aapl__pxrReserved__::VtValue *Typeid;
  pxrInternal__aapl__pxrReserved__::VtValue *v19;
  _OWORD v20[2];
  uint64_t v21;
  NSTimeInterval v22;
  _QWORD v23[2];
  _BYTE v24[16];
  uint64_t v25[3];

  v5 = count;
  v25[2] = *MEMORY[0x1E0C80C00];
  elementCount = self->_elementCount;
  if (elementCount == count)
  {
    v21 = 0;
    memset(v20, 0, sizeof(v20));
    sub_1DCB2525C((uint64_t)v20, count);
    if (v5)
    {
      v10 = 0;
      v11 = &array->i64[1];
      do
      {
        v12 = *(v11 - 1);
        v13 = *(_DWORD *)v11;
        sub_1DCAF0E2C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v20);
        v14 = v21 + v10;
        *(_QWORD *)v14 = v12;
        *(_DWORD *)(v14 + 8) = v13;
        v11 += 2;
        v10 += 12;
        --v5;
      }
      while (v5);
    }
    v25[0] = 0;
    v25[1] = (uint64_t)&off_1EA575998;
    sub_1DCB272BC(v25, (uint64_t)v20);
    begin = self->super._timeSampledData.__begin_;
    if (self->super._timeSampledData.__end_ != begin)
    {
      v22 = 0.0;
      v23[0] = 0;
      sub_1DCB25EEC(&v22, (_QWORD *)begin + 1);
      if ((sub_1DCB26964((pxrInternal__aapl__pxrReserved__::VtValue *)&v22) & 1) == 0)
      {
        objc_msgSend_defaultVtValue(self, v16, v17);
        Typeid = (pxrInternal__aapl__pxrReserved__::VtValue *)pxrInternal__aapl__pxrReserved__::VtValue::GetTypeid((pxrInternal__aapl__pxrReserved__::VtValue *)v24);
        v19 = sub_1DCBE446C((pxrInternal__aapl__pxrReserved__::VtValue *)v25, Typeid);
        sub_1DCB9AD14(v25, v19);
        sub_1DCAEEE2C((uint64_t)v24);
      }
      sub_1DCAEEE2C((uint64_t)&v22);
    }
    v22 = time;
    sub_1DCB25EEC(v23, v25);
    sub_1DCBD7754((uint64_t *)&self->super._timeSampledData, &v22);
    sub_1DCAEEE2C((uint64_t)v23);
    sub_1DCAEEE2C((uint64_t)v25);
    sub_1DCAEEE78((uint64_t)v20);
  }
  else
  {
    NSLog(CFSTR("array count (%lu) has to match MDLAnimatedVector3Array.elementCount (%lu)"), a2, array, time, count, elementCount);
  }
}

- (void)setDouble3Array:(const vector_double3 *)array count:(NSUInteger)count atTime:(NSTimeInterval)time
{
  NSUInteger v5;
  unint64_t elementCount;
  const vector_double3 *v8;
  uint64_t v10;
  uint64_t v11;
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
    v8 = array;
    v20 = 0;
    memset(v19, 0, sizeof(v19));
    sub_1DCBD94F8((uint64_t)v19, count);
    if (v5)
    {
      v10 = 0;
      do
      {
        v17 = *(_OWORD *)v8->f64;
        v18 = *(_OWORD *)&v8->f64[2];
        sub_1DCBE6110((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v19);
        v11 = v20 + v10;
        *(_OWORD *)v11 = v17;
        *(_QWORD *)(v11 + 16) = v18;
        ++v8;
        v10 += 24;
        --v5;
      }
      while (v5);
    }
    v24[0] = 0;
    v24[1] = (uint64_t)&off_1EA5758E0;
    sub_1DCB272BC(v24, (uint64_t)v19);
    begin = self->super._timeSampledData.__begin_;
    if (self->super._timeSampledData.__end_ != begin)
    {
      v21 = 0.0;
      v22[0] = 0;
      sub_1DCB25EEC(&v21, (_QWORD *)begin + 1);
      if ((sub_1DCBD929C((pxrInternal__aapl__pxrReserved__::VtValue *)&v21) & 1) == 0)
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
    NSLog(CFSTR("array count (%lu) has to match MDLAnimatedVector3Array.elementCount (%lu)"), a2, array, time, count, elementCount);
  }
}

- (NSUInteger)getFloat3Array:(vector_float3 *)array maxCount:(NSUInteger)maxCount atTime:(NSTimeInterval)time
{
  NSUInteger v5;
  NSUInteger elementCount;
  vector_float3 *v8;
  std::type_info *v10;
  __int128 *v11;
  uint64_t v12;
  NSUInteger v13;
  vector_float3 v14;
  uint64_t v15;
  NSUInteger v16;
  vector_float3 v17;
  std::type_info *v18;
  __int128 *v19;
  __int128 v20;
  NSUInteger v21;
  uint64_t v22;
  unsigned int v23;
  float32x2_t v24;
  NSUInteger v25;
  float32x2_t v26;
  float v27;
  vector_float3 v28;
  __int128 v30;
  float v31;
  _OWORD v32[2];
  uint64_t v33;
  _OWORD v34[2];
  uint64_t v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v5 = maxCount;
  v42 = *MEMORY[0x1E0C80C00];
  elementCount = self->_elementCount;
  if (elementCount <= maxCount)
  {
    v8 = array;
    v39 = 0.0;
    v40 = 0;
    v41 = 0;
    v36 = 0.0;
    v37 = 0;
    v38 = 0;
    v35 = 0;
    memset(v34, 0, sizeof(v34));
    v33 = 0;
    memset(v32, 0, sizeof(v32));
    sub_1DCBD8170((double **)&self->super._timeSampledData, (uint64_t)&v39, (uint64_t)&v36, time);
    if (v41)
    {
      if ((sub_1DCB26964((pxrInternal__aapl__pxrReserved__::VtValue *)&v40) & 1) != 0
        || (v10 = sub_1DCBDA06C((pxrInternal__aapl__pxrReserved__::VtValue *)&v40), sub_1DCB9AD14(&v40, v10), v41))
      {
        v11 = (__int128 *)sub_1DCB23B80((pxrInternal__aapl__pxrReserved__::VtValue *)&v40);
        sub_1DCB301A0((uint64_t)v34, v11);
        if (!self->super._interpolation)
        {
          if (*(_QWORD *)&v34[0] < v5)
            v5 = *(_QWORD *)&v34[0];
          if (v5)
          {
            v15 = 0;
            v16 = v5;
            do
            {
              sub_1DCAF0E2C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v34);
              v17.i64[0] = *(_QWORD *)(v35 + v15);
              v17.i32[2] = *(_DWORD *)(v35 + v15 + 8);
              *v8++ = v17;
              v15 += 12;
              --v16;
            }
            while (v16);
          }
          goto LABEL_32;
        }
        if (v38)
        {
          if (v39 == v36)
          {
            if (*(_QWORD *)&v34[0] < v5)
              v5 = *(_QWORD *)&v34[0];
            if (v5)
            {
              v12 = 0;
              v13 = v5;
              do
              {
                sub_1DCAF0E2C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v34);
                v14.i64[0] = *(_QWORD *)(v35 + v12);
                v14.i32[2] = *(_DWORD *)(v35 + v12 + 8);
                *v8++ = v14;
                v12 += 12;
                --v13;
              }
              while (v13);
            }
            goto LABEL_32;
          }
          if ((sub_1DCB8CE70((pxrInternal__aapl__pxrReserved__::VtValue *)&v37) & 1) != 0
            || (v18 = sub_1DCBDA06C((pxrInternal__aapl__pxrReserved__::VtValue *)&v37), sub_1DCB9AD14(&v37, v18), v38))
          {
            v19 = (__int128 *)sub_1DCB23B80((pxrInternal__aapl__pxrReserved__::VtValue *)&v37);
            sub_1DCB301A0((uint64_t)v32, v19);
            v21 = *(_QWORD *)&v34[0];
            if (*(_QWORD *)&v32[0] < *(_QWORD *)&v34[0])
              v21 = *(_QWORD *)&v32[0];
            if (v21 < v5)
              v5 = v21;
            if (v5)
            {
              v22 = 0;
              *(double *)&v20 = fmax(fmin((time - v39) / (v36 - v39), 1.0), 0.0);
              *(float *)&v23 = *(double *)&v20;
              *(float *)&v20 = 1.0 - *(float *)&v23;
              v30 = v20;
              v31 = *(float *)&v23;
              v24 = (float32x2_t)vdup_lane_s32((int32x2_t)v23, 0);
              v25 = v5;
              do
              {
                sub_1DCAF0E2C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v34);
                v26 = *(float32x2_t *)(v35 + v22);
                v27 = *(float *)(v35 + v22 + 8);
                sub_1DCAF0E2C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v32);
                v28.i32[3] = HIDWORD(v30);
                *(float32x2_t *)v28.f32 = vmla_f32(vmul_n_f32(v26, *(float *)&v30), v24, *(float32x2_t *)(v33 + v22));
                v28.f32[2] = (float)(v27 * *(float *)&v30) + (float)(*(float *)(v33 + v22 + 8) * v31);
                *v8++ = v28;
                v22 += 12;
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
    sub_1DCAEEE78((uint64_t)v32);
    sub_1DCAEEE78((uint64_t)v34);
    sub_1DCAEEE2C((uint64_t)&v37);
    sub_1DCAEEE2C((uint64_t)&v40);
    return v5;
  }
  NSLog(CFSTR("array count (%lu) has to match MDLAnimatedVector3Array.elementCount (%lu)"), a2, array, time, maxCount, elementCount);
  return 0;
}

- (NSUInteger)getDouble3Array:(vector_double3 *)array maxCount:(NSUInteger)maxCount atTime:(NSTimeInterval)time
{
  NSUInteger v5;
  NSUInteger elementCount;
  vector_double3 *v8;
  std::type_info *v10;
  __int128 *v11;
  uint64_t v12;
  NSUInteger v13;
  __int128 v14;
  uint64_t v15;
  NSUInteger v16;
  __int128 v17;
  std::type_info *v18;
  __int128 *v19;
  NSUInteger v20;
  uint64_t v21;
  double v22;
  double v23;
  NSUInteger v24;
  double v25;
  double v26;
  double v27;
  __int128 v28;
  __int128 v29;
  _OWORD v31[2];
  uint64_t v32;
  _OWORD v33[2];
  uint64_t v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v5 = maxCount;
  v41 = *MEMORY[0x1E0C80C00];
  elementCount = self->_elementCount;
  if (elementCount <= maxCount)
  {
    v8 = array;
    v38 = 0.0;
    v39 = 0;
    v40 = 0;
    v35 = 0.0;
    v36 = 0;
    v37 = 0;
    v34 = 0;
    memset(v33, 0, sizeof(v33));
    v32 = 0;
    memset(v31, 0, sizeof(v31));
    sub_1DCBD8170((double **)&self->super._timeSampledData, (uint64_t)&v38, (uint64_t)&v35, time);
    if (v40)
    {
      if ((sub_1DCBD929C((pxrInternal__aapl__pxrReserved__::VtValue *)&v39) & 1) != 0
        || (v10 = sub_1DCBDA468((pxrInternal__aapl__pxrReserved__::VtValue *)&v39), sub_1DCB9AD14(&v39, v10), v40))
      {
        v11 = (__int128 *)sub_1DCBDA4F0((pxrInternal__aapl__pxrReserved__::VtValue *)&v39);
        sub_1DCBDA558((uint64_t)v33, v11);
        if (!self->super._interpolation)
        {
          if (*(_QWORD *)&v33[0] < v5)
            v5 = *(_QWORD *)&v33[0];
          if (v5)
          {
            v15 = 0;
            v16 = v5;
            do
            {
              sub_1DCBE6110((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v33);
              *(_QWORD *)&v17 = *(_QWORD *)(v34 + v15 + 16);
              *(_OWORD *)v8->f64 = *(_OWORD *)(v34 + v15);
              *(_OWORD *)&v8->f64[2] = v17;
              ++v8;
              v15 += 24;
              --v16;
            }
            while (v16);
          }
          goto LABEL_32;
        }
        if (v37)
        {
          if (v38 == v35)
          {
            if (*(_QWORD *)&v33[0] < v5)
              v5 = *(_QWORD *)&v33[0];
            if (v5)
            {
              v12 = 0;
              v13 = v5;
              do
              {
                sub_1DCBE6110((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v33);
                *(_QWORD *)&v14 = *(_QWORD *)(v34 + v12 + 16);
                *(_OWORD *)v8->f64 = *(_OWORD *)(v34 + v12);
                *(_OWORD *)&v8->f64[2] = v14;
                ++v8;
                v12 += 24;
                --v13;
              }
              while (v13);
            }
            goto LABEL_32;
          }
          if ((sub_1DCBDA610((pxrInternal__aapl__pxrReserved__::VtValue *)&v36) & 1) != 0
            || (v18 = sub_1DCBDA468((pxrInternal__aapl__pxrReserved__::VtValue *)&v36), sub_1DCB9AD14(&v36, v18), v37))
          {
            v19 = (__int128 *)sub_1DCBDA4F0((pxrInternal__aapl__pxrReserved__::VtValue *)&v36);
            sub_1DCBDA558((uint64_t)v31, v19);
            v20 = *(_QWORD *)&v33[0];
            if (*(_QWORD *)&v31[0] < *(_QWORD *)&v33[0])
              v20 = *(_QWORD *)&v31[0];
            if (v20 < v5)
              v5 = v20;
            if (v5)
            {
              v21 = 0;
              v22 = fmax(fmin((time - v38) / (v35 - v38), 1.0), 0.0);
              v23 = 1.0 - v22;
              v24 = v5;
              do
              {
                sub_1DCBE6110((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v33);
                v25 = *(double *)(v34 + v21);
                v26 = *(double *)(v34 + v21 + 8);
                v27 = *(double *)(v34 + v21 + 16);
                sub_1DCBE6110((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v31);
                *(double *)&v28 = v25 * v23 + *(double *)(v32 + v21) * v22;
                *((double *)&v28 + 1) = v26 * v23 + *(double *)(v32 + v21 + 8) * v22;
                *(double *)&v29 = v27 * v23 + *(double *)(v32 + v21 + 16) * v22;
                *(_OWORD *)v8->f64 = v28;
                *(_OWORD *)&v8->f64[2] = v29;
                ++v8;
                v21 += 24;
                --v24;
              }
              while (v24);
            }
            goto LABEL_32;
          }
        }
      }
    }
    v5 = 0;
LABEL_32:
    sub_1DCAEEE78((uint64_t)v31);
    sub_1DCAEEE78((uint64_t)v33);
    sub_1DCAEEE2C((uint64_t)&v36);
    sub_1DCAEEE2C((uint64_t)&v39);
    return v5;
  }
  NSLog(CFSTR("array count (%lu) has to match MDLAnimatedVector3Array.elementCount (%lu)"), a2, array, time, maxCount, elementCount);
  return 0;
}

- (void)resetWithFloat3Array:(const vector_float3 *)valuesArray count:(NSUInteger)valuesCount atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)timesCount
{
  unint64_t elementCount;
  TimeSampledVtValue *end;
  TimeSampledVtValue *begin;
  uint64_t *p_timeSampledData;
  TimeSampledVtValue *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t *v22;
  _OWORD v24[2];
  uint64_t v25;
  NSTimeInterval v26;
  uint64_t v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
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
    v25 = 0;
    memset(v24, 0, sizeof(v24));
    sub_1DCB2525C((uint64_t)v24, elementCount);
    if (timesCount)
    {
      v14 = 0;
      v15 = 0;
      v22 = &valuesArray->i64[1];
      do
      {
        if (self->_elementCount)
        {
          v16 = 0;
          v17 = 0;
          v18 = &v22[2 * v14];
          do
          {
            v19 = *(v18 - 1);
            v20 = *(_DWORD *)v18;
            sub_1DCAF0E2C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v24);
            v21 = v25 + v16;
            *(_QWORD *)v21 = v19;
            *(_DWORD *)(v21 + 8) = v20;
            ++v17;
            v18 += 2;
            v16 += 12;
          }
          while (v17 < self->_elementCount);
          v14 += v17;
        }
        v26 = timesArray[v15];
        v27[1] = (uint64_t)&off_1EA575998;
        sub_1DCB272BC(v27, (uint64_t)v24);
        sub_1DCBD733C(p_timeSampledData, &v26);
        sub_1DCAEEE2C((uint64_t)v27);
        ++v15;
      }
      while (v15 != timesCount);
    }
    sub_1DCAEEE78((uint64_t)v24);
  }
  else
  {
    NSLog(CFSTR("value array count mismatch: expected %lu * %lu = %lu elements, but got %lu"), a2, valuesArray, timesCount, elementCount, elementCount * timesCount, valuesCount);
  }
}

- (void)resetWithDouble3Array:(const vector_double3 *)valuesArray count:(NSUInteger)valuesCount atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)timesCount
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
  const vector_double3 *v17;
  uint64_t v18;
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
    sub_1DCBD94F8((uint64_t)v23, elementCount);
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
          do
          {
            v17 = &valuesArray[v13 + v16];
            v21 = *(_OWORD *)v17->f64;
            v22 = *(_OWORD *)&v17->f64[2];
            sub_1DCBE6110((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v23);
            v18 = v24 + v15;
            *(_OWORD *)v18 = v21;
            *(_QWORD *)(v18 + 16) = v22;
            ++v16;
            v15 += 24;
          }
          while (v16 < self->_elementCount);
          v13 += v16;
        }
        v25 = timesArray[v14];
        v26[1] = (uint64_t)&off_1EA5758E0;
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

- (NSUInteger)getFloat3Array:(vector_float3 *)valuesArray maxCount:(NSUInteger)maxCount
{
  TimeSampledVtValue *end;
  TimeSampledVtValue *begin;
  unint64_t v7;
  NSUInteger result;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  std::type_info *v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  vector_float3 v21;
  unint64_t v22;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  begin = self->super._timeSampledData.__begin_;
  end = self->super._timeSampledData.__end_;
  v7 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
  result = v7 * self->_elementCount;
  if (result <= maxCount)
  {
    if (end != begin)
    {
      v9 = 0;
      v10 = 0;
      v22 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
      if (v7 <= 1)
        v11 = 1;
      else
        v11 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
      do
      {
        v27 = 0;
        v28[0] = 0;
        v28[1] = 0;
        v12 = (uint64_t *)((char *)self->super._timeSampledData.__begin_ + 24 * v9);
        v27 = *v12;
        sub_1DCB25EEC(v28, v12 + 1);
        if ((sub_1DCB26964((pxrInternal__aapl__pxrReserved__::VtValue *)v28) & 1) == 0)
        {
          v13 = sub_1DCBDA06C((pxrInternal__aapl__pxrReserved__::VtValue *)v28);
          sub_1DCB9AD14(v28, v13);
        }
        if (sub_1DCB26964((pxrInternal__aapl__pxrReserved__::VtValue *)v28))
        {
          v26 = 0;
          v24 = 0u;
          v25 = 0u;
          v14 = sub_1DCB23B80((pxrInternal__aapl__pxrReserved__::VtValue *)v28);
          v15 = *(_OWORD *)(v14 + 16);
          v24 = *(_OWORD *)v14;
          v25 = v15;
          v16 = *(_QWORD *)(v14 + 32);
          v26 = v16;
          if (v16)
          {
            v17 = (unint64_t *)(v16 - 16);
            if (*((_QWORD *)&v25 + 1))
              v17 = (unint64_t *)*((_QWORD *)&v25 + 1);
            do
              v18 = __ldxr(v17);
            while (__stxr(v18 + 1, v17));
          }
          if (self->_elementCount)
          {
            v19 = 0;
            v20 = 0;
            do
            {
              sub_1DCAF0E2C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v24);
              v21.i64[0] = *(_QWORD *)(v26 + v19);
              v21.i32[2] = *(_DWORD *)(v26 + v19 + 8);
              valuesArray[v10 + v20++] = v21;
              v19 += 12;
            }
            while (v20 < self->_elementCount);
            v10 += v20;
          }
          sub_1DCAEEE78((uint64_t)&v24);
        }
        sub_1DCAEEE2C((uint64_t)v28);
        ++v9;
      }
      while (v9 != v11);
      return self->_elementCount * v22;
    }
  }
  else
  {
    NSLog(CFSTR("valuesArray size is too small (%lu elements) to hold all %lu elements"), a2, maxCount, result);
    return 0;
  }
  return result;
}

- (NSUInteger)getDouble3Array:(vector_double3 *)valuesArray maxCount:(NSUInteger)maxCount
{
  TimeSampledVtValue *end;
  TimeSampledVtValue *begin;
  unint64_t v7;
  NSUInteger result;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  std::type_info *v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  __int128 v21;
  vector_double3 *v22;
  unint64_t v23;
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
      v9 = 0;
      v10 = 0;
      v23 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
      if (v7 <= 1)
        v11 = 1;
      else
        v11 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
      do
      {
        v28 = 0;
        v29[0] = 0;
        v29[1] = 0;
        v12 = (uint64_t *)((char *)self->super._timeSampledData.__begin_ + 24 * v9);
        v28 = *v12;
        sub_1DCB25EEC(v29, v12 + 1);
        if ((sub_1DCBD929C((pxrInternal__aapl__pxrReserved__::VtValue *)v29) & 1) == 0)
        {
          v13 = sub_1DCBDA468((pxrInternal__aapl__pxrReserved__::VtValue *)v29);
          sub_1DCB9AD14(v29, v13);
        }
        if (sub_1DCBD929C((pxrInternal__aapl__pxrReserved__::VtValue *)v29))
        {
          v27 = 0;
          v25 = 0u;
          v26 = 0u;
          v14 = sub_1DCBDA4F0((pxrInternal__aapl__pxrReserved__::VtValue *)v29);
          v15 = *(_OWORD *)(v14 + 16);
          v25 = *(_OWORD *)v14;
          v26 = v15;
          v16 = *(_QWORD *)(v14 + 32);
          v27 = v16;
          if (v16)
          {
            v17 = (unint64_t *)(v16 - 16);
            if (*((_QWORD *)&v26 + 1))
              v17 = (unint64_t *)*((_QWORD *)&v26 + 1);
            do
              v18 = __ldxr(v17);
            while (__stxr(v18 + 1, v17));
          }
          if (self->_elementCount)
          {
            v19 = 0;
            v20 = 0;
            do
            {
              sub_1DCBE6110((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v25);
              *(_QWORD *)&v21 = *(_QWORD *)(v27 + v19 + 16);
              v22 = &valuesArray[v10 + v20];
              *(_OWORD *)v22->f64 = *(_OWORD *)(v27 + v19);
              *(_OWORD *)&v22->f64[2] = v21;
              ++v20;
              v19 += 24;
            }
            while (v20 < self->_elementCount);
            v10 += v20;
          }
          sub_1DCAEEE78((uint64_t)&v25);
        }
        sub_1DCAEEE2C((uint64_t)v29);
        ++v9;
      }
      while (v9 != v11);
      return self->_elementCount * v23;
    }
  }
  else
  {
    NSLog(CFSTR("valuesArray size is too small (%lu elements) to hold all %lu elements"), a2, maxCount, result);
    return 0;
  }
  return result;
}

- (void)setElementCount:(unint64_t)a3
{
  self->_elementCount = a3;
}

@end
