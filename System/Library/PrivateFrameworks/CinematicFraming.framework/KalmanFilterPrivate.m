@implementation KalmanFilterPrivate

- (KalmanFilterPrivate)init
{
  KalmanFilterPrivate *v2;
  KalmanFilterPrivate *v3;
  KalmanFilterPrivate *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)KalmanFilterPrivate;
  v2 = -[KalmanFilterPrivate init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)v2->_anon_20 = xmmword_1D4E43C80;
    *(_OWORD *)&v2->_anon_20[16] = unk_1D4E43C90;
    *(_OWORD *)&v2->_anon_20[32] = xmmword_1D4E43CA0;
    *(_OWORD *)&v2->_anon_60[4] = xmmword_1D4E43CB0;
    *(_OWORD *)&v2->_anon_60[20] = unk_1D4E43CC0;
    *(_OWORD *)&v2->_anon_60[36] = xmmword_1D4E43CD0;
    *(_OWORD *)&v2->_observationModel[4] = xmmword_1D4E43A80;
    *(_QWORD *)&v2->_measurementNoise = 0x3D4CCCCD3F266666;
    __asm { FMOV            V0.4S, #1.0 }
    *(_OWORD *)&v2->_noiseScaling[4] = _Q0;
    *(_OWORD *)&v2->_noiseBase[4] = 0u;
    LOBYTE(v2[1].super.isa) = 1;
    v9 = v2;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }

  return v3;
}

- (void)_predict:(KalmanFilterPrivate *)self
{
  __int128 v2;
  uint64_t v3;
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  uint64_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  int32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  unint64_t v14;
  float32x4_t v15;
  float32x4_t v16;
  _OWORD v17[2];
  int32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;

  v3 = 0;
  v5 = *(float32x4_t *)&self->_anon_60[4];
  v4 = *(float32x4_t *)&self->_anon_60[20];
  v6 = *(float32x4_t *)&self->_anon_60[36];
  *(float32x4_t *)self->_stateEstimate = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v5, COERCE_FLOAT(*(_OWORD *)self->_stateEstimate)), v4, *(float32x2_t *)self->_stateEstimate, 1), v6, *(float32x4_t *)self->_stateEstimate, 2);
  v18 = *(int32x4_t *)&self->_anon_20[32];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v19 + v3 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v5, COERCE_FLOAT(v17[v3])), v4, *(float32x2_t *)&v17[v3], 1), v6, (float32x4_t)v17[v3], 2);
    ++v3;
  }
  while (v3 != 3);
  v7 = 0;
  v8 = v19;
  v9 = v20;
  v10 = v21;
  v11 = vzip1q_s32((int32x4_t)v5, (int32x4_t)v6);
  v17[0] = vzip1q_s32(v11, (int32x4_t)v4);
  v17[1] = vzip2q_s32(v11, vdupq_lane_s32(*(int32x2_t *)v4.f32, 1));
  v18 = vzip1q_s32(vzip2q_s32((int32x4_t)v5, (int32x4_t)v6), vdupq_laneq_s32((int32x4_t)v4, 2));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v19 + v7 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v8, COERCE_FLOAT(v17[v7])), v9, *(float32x2_t *)&v17[v7], 1), v10, (float32x4_t)v17[v7], 2);
    ++v7;
  }
  while (v7 != 3);
  v12.i64[0] = 0;
  v13 = vaddq_f32((float32x4_t)v2, v19);
  LODWORD(v14) = 0;
  HIDWORD(v14) = DWORD1(v2);
  v15 = vaddq_f32((float32x4_t)v14, v20);
  v12.i64[1] = DWORD2(v2);
  v16 = vaddq_f32(v12, v21);
  *(_DWORD *)&self->_anon_20[8] = v13.i32[2];
  *(_DWORD *)&self->_anon_20[24] = v15.i32[2];
  *(_QWORD *)self->_anon_20 = v13.i64[0];
  *(_QWORD *)&self->_anon_20[16] = v15.i64[0];
  *(_DWORD *)&self->_anon_20[40] = v16.i32[2];
  *(_QWORD *)&self->_anon_20[32] = v16.i64[0];
}

- (void)_update:(float)a3
{
  int32x2_t v3;
  float32x4_t v6;
  uint64_t v7;
  float v8;
  __int128 v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  float32x4_t v19;
  _OWORD v20[3];
  __int128 v21;
  __int128 v22;
  __int128 v23;

  v6 = *(float32x4_t *)self->_anon_20;
  *(float *)v3.i32 = v6.f32[0] + *(float *)self->_noiseScaling;
  v19 = vdivq_f32(v6, (float32x4_t)vdupq_lane_s32(v3, 0));
  -[KalmanFilterPrivate estimatedObservation](self, "estimatedObservation");
  v7 = 0;
  v9 = *(_OWORD *)self->_anon_20;
  *(float32x4_t *)self->_stateEstimate = vmlaq_n_f32(*(float32x4_t *)self->_stateEstimate, v19, a3 - v8);
  v10 = *(float32x4_t *)&self->_observationModel[4];
  v11 = vsubq_f32(*MEMORY[0x1E0C83FE8], vmulq_n_f32(v19, v10.f32[0]));
  v12 = vsubq_f32(*(float32x4_t *)(MEMORY[0x1E0C83FE8] + 16), vmulq_lane_f32(v19, *(float32x2_t *)v10.f32, 1));
  v13 = vsubq_f32(*(float32x4_t *)(MEMORY[0x1E0C83FE8] + 32), vmulq_laneq_f32(v19, v10, 2));
  v14 = *(_OWORD *)&self->_anon_20[16];
  v15 = *(_OWORD *)&self->_anon_20[32];
  v20[0] = v9;
  v20[1] = v14;
  v20[2] = v15;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  do
  {
    *(__int128 *)((char *)&v21 + v7 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v11, COERCE_FLOAT(v20[v7])), v12, *(float32x2_t *)&v20[v7], 1), v13, (float32x4_t)v20[v7], 2);
    ++v7;
  }
  while (v7 != 3);
  v16 = v21;
  v17 = v22;
  v18 = v23;
  *(_DWORD *)&self->_anon_20[8] = DWORD2(v21);
  *(_DWORD *)&self->_anon_20[24] = DWORD2(v17);
  *(_QWORD *)self->_anon_20 = v16;
  *(_QWORD *)&self->_anon_20[16] = v17;
  *(_DWORD *)&self->_anon_20[40] = DWORD2(v18);
  *(_QWORD *)&self->_anon_20[32] = v18;
}

- (float)estimatedObservation
{
  float32x4_t v2;
  float result;

  v2 = vmulq_f32(*(float32x4_t *)&self->_observationModel[4], *(float32x4_t *)self->_stateEstimate);
  LODWORD(result) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v2, 2), vaddq_f32(v2, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v2.f32, 1))).u32[0];
  return result;
}

- (float)covariance
{
  return self->_trailingAlpha - (float)(self->_observationMeanSquared * self->_observationMeanSquared);
}

- (void)addObservation:(float)a3
{
  float previousObservation;
  float v5;
  float v6;
  float measurementNoise;
  float v8;
  float v9;
  __int128 v10;
  double v11;

  if (LOBYTE(self[1].super.isa))
  {
    *(_OWORD *)self->_stateEstimate = LODWORD(a3);
    self->_previousObservation = a3;
    LOBYTE(self[1].super.isa) = 0;
    previousObservation = a3;
  }
  else
  {
    previousObservation = self->_previousObservation;
  }
  v5 = a3 - previousObservation;
  v6 = (float)(a3 - previousObservation) - self->_previousVelocity;
  measurementNoise = self->_measurementNoise;
  v10 = *(_OWORD *)&a3;
  v8 = (float)((float)(v6 * v6) * (float)(1.0 - measurementNoise)) + (float)(self->_trailingAlpha * measurementNoise);
  self->_observationMeanSquared = (float)(v6 * (float)(1.0 - measurementNoise))
                                + (float)(self->_observationMeanSquared * measurementNoise);
  self->_trailingAlpha = v8;
  -[KalmanFilterPrivate covariance](self, "covariance", v10);
  -[KalmanFilterPrivate _predict:](self, "_predict:", *(double *)vmlaq_n_f32(*(float32x4_t *)&self->_noiseBase[4], *(float32x4_t *)&self->_noiseScaling[4], v9).i64);
  -[KalmanFilterPrivate _update:](self, "_update:", v11);
  self->_previousObservation = *(float *)&v11;
  self->_previousVelocity = v5;
  self->_previousAcceleration = v6;
}

- (float)trailingAlpha
{
  return self->_measurementNoise;
}

- (void)setTrailingAlpha:(float)a3
{
  self->_measurementNoise = a3;
}

- (float)measurementNoise
{
  return *(float *)self->_noiseScaling;
}

- (void)setMeasurementNoise:(float)a3
{
  *(float *)self->_noiseScaling = a3;
}

@end
