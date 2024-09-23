@implementation MDLAnimatedQuaternion

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MDLAnimatedQuaternion;
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
  if ((sub_1DCBDC044((pxrInternal__aapl__pxrReserved__::VtValue *)v5) & 1) != 0
    || (sub_1DCBE19E4((pxrInternal__aapl__pxrReserved__::VtValue *)v5) & 1) != 0)
  {
    sub_1DCAEEE2C((uint64_t)v5);
    return 1;
  }
  v4 = sub_1DCBDC5B8((pxrInternal__aapl__pxrReserved__::VtValue *)v5);
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
  if (!sub_1DCBE19E4((pxrInternal__aapl__pxrReserved__::VtValue *)v11))
  {
    if (sub_1DCBDC044((pxrInternal__aapl__pxrReserved__::VtValue *)v11))
    {
      v3[1] = (uint64_t)&off_1EA574BF0;
      v5 = operator new();
      v6 = (unsigned int *)(v5 + 16);
      atomic_store(0, (unsigned int *)(v5 + 16));
      *v3 = v5;
      do
        v7 = __ldxr(v6);
      while (__stxr(v7 + 1, v6));
      goto LABEL_11;
    }
    if (sub_1DCBDC5B8((pxrInternal__aapl__pxrReserved__::VtValue *)v11))
    {
      v3[1] = (uint64_t)&off_1EA574B38;
      v8 = operator new();
      v9 = (unsigned int *)(v8 + 32);
      atomic_store(0, (unsigned int *)(v8 + 32));
      *v3 = v8;
      do
        v10 = __ldxr(v9);
      while (__stxr(v10 + 1, v9));
      goto LABEL_11;
    }
    self = (MDLAnimatedQuaternion *)sub_1DCAEEE2C((uint64_t)v11);
LABEL_13:
    v3[1] = 0;
    goto LABEL_14;
  }
  v3[1] = (uint64_t)&off_1EA574CA8 + 1;
LABEL_11:
  self = (MDLAnimatedQuaternion *)sub_1DCAEEE2C((uint64_t)v11);
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
  if ((sub_1DCBE19E4((pxrInternal__aapl__pxrReserved__::VtValue *)v10) & 1) != 0
    || (sub_1DCBDC044((pxrInternal__aapl__pxrReserved__::VtValue *)v10) & 1) != 0
    || sub_1DCBDC5B8((pxrInternal__aapl__pxrReserved__::VtValue *)v10))
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
  if ((sub_1DCBE19E4((pxrInternal__aapl__pxrReserved__::VtValue *)v10) & 1) != 0
    || (sub_1DCBDC044((pxrInternal__aapl__pxrReserved__::VtValue *)v10) & 1) != 0
    || sub_1DCBDC5B8((pxrInternal__aapl__pxrReserved__::VtValue *)v10))
  {
    v8 = a5 * a4;
    sub_1DCB25EEC(v9, v10);
    sub_1DCBD733C((uint64_t *)&self->super._timeSampledData, &v8);
    sub_1DCAEEE2C((uint64_t)v9);
  }
  sub_1DCAEEE2C((uint64_t)v10);
}

- (void)setFloatQuaternion:(simd_quatf)value atTime:(NSTimeInterval)time
{
  simd_quatf *v6;
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
  v18[1] = &off_1EA574BF0;
  v6 = (simd_quatf *)operator new();
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
    if ((sub_1DCBDC044((pxrInternal__aapl__pxrReserved__::VtValue *)&v15) & 1) == 0)
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

- (uint64_t)setDoubleQuaternion:(uint64_t)a3 atTime:(__int128 *)a4
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
  v20[1] = &off_1EA574B38;
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
    if ((sub_1DCBDC5B8((pxrInternal__aapl__pxrReserved__::VtValue *)&v17) & 1) == 0)
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

- (simd_quatf)floatQuaternionAtTime:(NSTimeInterval)time
{
  char v5;
  pxrInternal__aapl__pxrReserved__::VtValue *v6;
  float32x4_t *v7;
  float32x4_t v8;
  pxrInternal__aapl__pxrReserved__::VtValue *v9;
  float32x4_t *v10;
  float v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float v15;
  float v16;
  float32x4_t v17;
  int8x16_t v18;
  float32x4_t v19;
  int8x16_t v20;
  float v21;
  float v22;
  BOOL v23;
  float v24;
  uint64_t v25;
  float32x2_t v26;
  float32x2_t v27;
  float v28;
  float v29;
  float32x4_t v30;
  float v31;
  float v32;
  float v33;
  float32x4_t v34;
  int8x16_t v35;
  float32x2_t v36;
  unsigned __int32 v37;
  float32x2_t v38;
  float32x2_t v39;
  float v41;
  float v42;
  float32x4_t v43;
  float32x4_t v44;
  simd_quatf v45;
  float32x4_t v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v50 = 0.0;
  v51 = 0;
  v52 = 0;
  v47 = 0.0;
  v48 = 0;
  v49 = 0;
  sub_1DCBD8170((double **)&self->super._timeSampledData, (uint64_t)&v50, (uint64_t)&v47, time);
  v45 = (simd_quatf)0;
  if (v52
    && ((sub_1DCBE19E4((pxrInternal__aapl__pxrReserved__::VtValue *)&v51) & 1) != 0
     || (sub_1DCBDC044((pxrInternal__aapl__pxrReserved__::VtValue *)&v51) & 1) != 0
     || (sub_1DCBDC5B8((pxrInternal__aapl__pxrReserved__::VtValue *)&v51) & 1) != 0))
  {
    v5 = sub_1DCBDC044((pxrInternal__aapl__pxrReserved__::VtValue *)&v51);
    v6 = (pxrInternal__aapl__pxrReserved__::VtValue *)&v51;
    if ((v5 & 1) == 0)
      v6 = (pxrInternal__aapl__pxrReserved__::VtValue *)sub_1DCBE2580((pxrInternal__aapl__pxrReserved__::VtValue *)&v51);
    v7 = (float32x4_t *)sub_1DCBE2518(v6);
    v8 = *v7;
    if (!self->super._interpolation)
      goto LABEL_25;
    v43 = *v7;
    if (v49)
    {
      if (v50 != v47
        && ((v9 = (pxrInternal__aapl__pxrReserved__::VtValue *)&v48,
             (sub_1DCBE19E4((pxrInternal__aapl__pxrReserved__::VtValue *)&v48) & 1) != 0)
         || (sub_1DCBDC044((pxrInternal__aapl__pxrReserved__::VtValue *)&v48) & 1) != 0
         || sub_1DCBDC5B8((pxrInternal__aapl__pxrReserved__::VtValue *)&v48)))
      {
        if ((sub_1DCBDC044((pxrInternal__aapl__pxrReserved__::VtValue *)&v48) & 1) == 0)
          v9 = (pxrInternal__aapl__pxrReserved__::VtValue *)sub_1DCBE2580((pxrInternal__aapl__pxrReserved__::VtValue *)&v48);
        v10 = (float32x4_t *)sub_1DCBE2518(v9);
        v11 = fmax(fmin((time - v50) / (v47 - v50), 1.0), 0.0);
        v12 = vmulq_f32(*v10, v43);
        v13 = (float32x4_t)vextq_s8((int8x16_t)v12, (int8x16_t)v12, 8uLL);
        *(float32x2_t *)v12.f32 = vadd_f32(*(float32x2_t *)v12.f32, *(float32x2_t *)v13.f32);
        v12.f32[0] = vaddv_f32(*(float32x2_t *)v12.f32);
        v13.i32[0] = 0;
        v14 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vmvnq_s8((int8x16_t)vcgeq_f32(v12, v13)), 0), (int8x16_t)vnegq_f32(*v10), *(int8x16_t *)v10);
        v15 = 1.0;
        v16 = 1.0 - v11;
        v17 = vsubq_f32(v43, v14);
        v18 = (int8x16_t)vmulq_f32(v17, v17);
        v46 = v14;
        v19 = vaddq_f32(v14, v43);
        v20 = (int8x16_t)vmulq_f32(v19, v19);
        v21 = atan2f(sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v18.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v18, v18, 8uLL)))), sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v20.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v20, v20, 8uLL)))));
        v22 = v21 + v21;
        v23 = (float)(v21 + v21) == 0.0;
        v24 = 1.0;
        if (!v23)
          v24 = sinf(v22) / v22;
        v25 = LODWORD(v24);
        v26 = vrecpe_f32((float32x2_t)LODWORD(v24));
        v27 = vmul_f32(vrecps_f32((float32x2_t)v25, v26), v26);
        LODWORD(v28) = vmul_f32(v27, vrecps_f32((float32x2_t)v25, v27)).u32[0];
        if ((float)(v16 * v22) != 0.0)
        {
          v41 = v28;
          v29 = sinf(v16 * v22);
          v28 = v41;
          v15 = v29 / (float)(v16 * v22);
        }
        v30 = vmulq_n_f32(v43, (float)(v28 * v16) * v15);
        v31 = v22 * v11;
        v32 = 1.0;
        if (v31 != 0.0)
        {
          v42 = v28;
          v44 = v30;
          v33 = sinf(v31);
          v28 = v42;
          v30 = v44;
          v32 = v33 / v31;
        }
        v34 = vmlaq_n_f32(v30, v46, (float)(v28 * v11) * v32);
        v35 = (int8x16_t)vmulq_f32(v34, v34);
        v36 = vadd_f32(*(float32x2_t *)v35.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v35, v35, 8uLL));
        if (vaddv_f32(v36) == 0.0)
        {
          v8 = (float32x4_t)xmmword_1DCC584A0;
        }
        else
        {
          v37 = vadd_f32(v36, (float32x2_t)vdup_lane_s32((int32x2_t)v36, 1)).u32[0];
          v38 = vrsqrte_f32((float32x2_t)v37);
          v39 = vmul_f32(vrsqrts_f32((float32x2_t)v37, vmul_f32(v38, v38)), v38);
          v8 = vmulq_n_f32(v34, vmul_f32(v39, vrsqrts_f32((float32x2_t)v37, vmul_f32(v39, v39))).f32[0]);
        }
      }
      else
      {
        v8 = v43;
      }
LABEL_25:
      v45 = (simd_quatf)v8;
    }
  }
  sub_1DCAEEE2C((uint64_t)&v48);
  sub_1DCAEEE2C((uint64_t)&v51);
  return v45;
}

- (simd_quatd)doubleQuaternionAtTime:(NSTimeInterval)time
{
  uint64_t v3;
  uint64_t v6;
  char v7;
  pxrInternal__aapl__pxrReserved__::VtValue *v8;
  float64x2_t *v9;
  float64x2_t v10;
  float64x2_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  pxrInternal__aapl__pxrReserved__::VtValue *v16;
  float64x2_t *v17;
  float64x2_t v18;
  float64x2_t v19;
  float v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23[2];
  float64x2_t v24[2];
  double v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  simd_quatd result;

  v6 = v3;
  v31 = *MEMORY[0x1E0C80C00];
  v28 = 0.0;
  v29 = 0;
  v30 = 0;
  v25 = 0.0;
  v26 = 0;
  v27 = 0;
  sub_1DCBD8170((double **)&self->super._timeSampledData, (uint64_t)&v28, (uint64_t)&v25, time);
  if (!v30
    || (sub_1DCBE19E4((pxrInternal__aapl__pxrReserved__::VtValue *)&v29) & 1) == 0
    && (sub_1DCBDC044((pxrInternal__aapl__pxrReserved__::VtValue *)&v29) & 1) == 0
    && (sub_1DCBDC5B8((pxrInternal__aapl__pxrReserved__::VtValue *)&v29) & 1) == 0)
  {
    goto LABEL_12;
  }
  v7 = sub_1DCBDC5B8((pxrInternal__aapl__pxrReserved__::VtValue *)&v29);
  v8 = (pxrInternal__aapl__pxrReserved__::VtValue *)&v29;
  if ((v7 & 1) == 0)
    v8 = (pxrInternal__aapl__pxrReserved__::VtValue *)sub_1DCBE2884((pxrInternal__aapl__pxrReserved__::VtValue *)&v29);
  v9 = (float64x2_t *)sub_1DCBE281C(v8);
  v10 = *v9;
  v11 = v9[1];
  if (!self->super._interpolation)
    goto LABEL_11;
  v21 = *v9;
  v22 = v9[1];
  if (!v27)
  {
LABEL_12:
    *(_OWORD *)v6 = 0u;
    *(_OWORD *)(v6 + 16) = 0u;
    goto LABEL_13;
  }
  if (v28 == v25
    || (v16 = (pxrInternal__aapl__pxrReserved__::VtValue *)&v26,
        (sub_1DCBE19E4((pxrInternal__aapl__pxrReserved__::VtValue *)&v26) & 1) == 0)
    && (sub_1DCBDC044((pxrInternal__aapl__pxrReserved__::VtValue *)&v26) & 1) == 0
    && (sub_1DCBDC5B8((pxrInternal__aapl__pxrReserved__::VtValue *)&v26) & 1) == 0)
  {
    v10 = v21;
    v11 = v22;
LABEL_11:
    *(float64x2_t *)v6 = v10;
    *(float64x2_t *)(v6 + 16) = v11;
    goto LABEL_13;
  }
  if ((sub_1DCBDC5B8((pxrInternal__aapl__pxrReserved__::VtValue *)&v26) & 1) == 0)
    v16 = (pxrInternal__aapl__pxrReserved__::VtValue *)sub_1DCBE2884((pxrInternal__aapl__pxrReserved__::VtValue *)&v26);
  v17 = (float64x2_t *)sub_1DCBE281C(v16);
  v18 = *v17;
  v19 = v17[1];
  v20 = fmax(fmin((time - v28) / (v25 - v28), 1.0), 0.0);
  v24[0] = v21;
  v24[1] = v22;
  v23[0] = v18;
  v23[1] = v19;
  sub_1DCBDC5F0(v24, v23, (float64x2_t *)v6, v20);
LABEL_13:
  sub_1DCAEEE2C((uint64_t)&v26);
  sub_1DCAEEE2C((uint64_t)&v29);
  result.vector.f64[3] = v15;
  result.vector.f64[2] = v14;
  result.vector.f64[1] = v13;
  result.vector.f64[0] = v12;
  return result;
}

- (void)resetWithFloatQuaternionArray:(const simd_quatf *)valuesArray atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)count
{
  TimeSampledVtValue *end;
  uint64_t *p_timeSampledData;
  TimeSampledVtValue *begin;
  TimeSampledVtValue *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int *v15;
  unsigned int v16;
  simd_quatf v17;
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
      v19[1] = &off_1EA574BF0;
      v17 = valuesArray[v13];
      v14 = operator new();
      *(simd_quatf *)v14 = v17;
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

- (void)resetWithDoubleQuaternionArray:(const simd_quatd *)valuesArray atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)count
{
  TimeSampledVtValue *end;
  uint64_t *p_timeSampledData;
  TimeSampledVtValue *begin;
  TimeSampledVtValue *v12;
  uint64_t v13;
  const simd_quatd *v14;
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
      v18 = *(_OWORD *)v14->vector.f64;
      v19 = *(_OWORD *)&v14->vector.f64[2];
      v21[1] = &off_1EA574B38;
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

- (NSUInteger)getFloatQuaternionArray:(simd_quatf *)valuesArray maxCount:(NSUInteger)maxCount
{
  unint64_t v4;
  uint64_t v7;
  unint64_t v8;
  simd_quatf *v9;
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
      if (sub_1DCBDC044((pxrInternal__aapl__pxrReserved__::VtValue *)v12))
      {
        v9 = (simd_quatf *)sub_1DCBE2518((pxrInternal__aapl__pxrReserved__::VtValue *)v12);
      }
      else
      {
        v10 = (pxrInternal__aapl__pxrReserved__::VtValue *)sub_1DCBE2580((pxrInternal__aapl__pxrReserved__::VtValue *)v12);
        v9 = (simd_quatf *)sub_1DCBE2518(v10);
      }
      *valuesArray++ = *v9;
      sub_1DCAEEE2C((uint64_t)v12);
      v7 += 24;
      --v8;
    }
    while (v8);
  }
  return v4;
}

- (NSUInteger)getDoubleQuaternionArray:(simd_quatd *)valuesArray maxCount:(NSUInteger)maxCount
{
  unint64_t v4;
  uint64_t v7;
  unint64_t v8;
  _OWORD *v9;
  pxrInternal__aapl__pxrReserved__::VtValue *v10;
  __int128 v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
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
      v13[0] = 0;
      v13[1] = 0;
      sub_1DCB25EEC(v13, (TimeSampledVtValue *)((char *)self->super._timeSampledData.__begin_ + v7 + 8));
      if (sub_1DCBDC5B8((pxrInternal__aapl__pxrReserved__::VtValue *)v13))
      {
        v9 = (_OWORD *)sub_1DCBE281C((pxrInternal__aapl__pxrReserved__::VtValue *)v13);
      }
      else
      {
        v10 = (pxrInternal__aapl__pxrReserved__::VtValue *)sub_1DCBE2884((pxrInternal__aapl__pxrReserved__::VtValue *)v13);
        v9 = (_OWORD *)sub_1DCBE281C(v10);
      }
      v11 = v9[1];
      *(_OWORD *)valuesArray->vector.f64 = *v9;
      *(_OWORD *)&valuesArray->vector.f64[2] = v11;
      ++valuesArray;
      sub_1DCAEEE2C((uint64_t)v13);
      v7 += 24;
      --v8;
    }
    while (v8);
  }
  return v4;
}

@end
