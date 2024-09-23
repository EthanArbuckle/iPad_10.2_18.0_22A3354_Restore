@implementation ARCoachingInstanceTransform

- (__n128)transform
{
  return a1[5];
}

- (__n128)localScale
{
  return a1[9];
}

- (void)setLocalScale:(ARCoachingInstanceTransform *)self
{
  __int128 v2;

  *(_OWORD *)self->_localScale = v2;
  -[ARCoachingInstanceTransform doTransform](self, "doTransform");
}

- (__n128)localTranslation
{
  return a1[10];
}

- (void)setLocalTranslation:(ARCoachingInstanceTransform *)self
{
  __int128 v2;

  *(_OWORD *)self->_localTranslation = v2;
  -[ARCoachingInstanceTransform doTransform](self, "doTransform");
}

- (ARCoachingInstanceTransform)init:(__n128)a3
{
  ARCoachingInstanceTransform *v5;
  ARCoachingInstanceTransform *v6;
  objc_super v17;

  v17.receiver = a1;
  v17.super_class = (Class)ARCoachingInstanceTransform;
  v5 = -[ARCoachingInstanceTransform init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    *(__n128 *)v5->_anon_10 = a2;
    *(__n128 *)&v5->_anon_10[16] = a3;
    *(__n128 *)&v5->_anon_10[32] = a4;
    *(__n128 *)&v5->_anon_10[48] = a5;
    *(__n128 *)v5->_anon_50 = a2;
    *(__n128 *)&v5->_anon_50[16] = a3;
    *(__n128 *)&v5->_anon_50[32] = a4;
    *(__n128 *)&v5->_anon_50[48] = a5;
    *(_OWORD *)v5->_localScale = 0u;
    *(_OWORD *)v5->_localTranslation = 0u;
    __asm { FMOV            V0.4S, #1.0 }
    -[ARCoachingInstanceTransform setRecordedScale:](v5, "setRecordedScale:", *(double *)&_Q0);
    -[ARCoachingInstanceTransform setRecordedTranslation:](v6, "setRecordedTranslation:", 0.0);
  }
  return v6;
}

- (void)doTransform
{
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;

  -[ARCoachingInstanceTransform localScale](self, "localScale");
  +[ARCoachingTransformations scale:](ARCoachingTransformations, "scale:");
  v21 = v4;
  v22 = v3;
  v19 = v6;
  v20 = v5;
  -[ARCoachingInstanceTransform localTranslation](self, "localTranslation");
  +[ARCoachingTransformations translate:](ARCoachingTransformations, "translate:");
  v11 = 0;
  v12 = *(_OWORD *)&self->_anon_10[16];
  v13 = *(_OWORD *)&self->_anon_10[32];
  v14 = *(_OWORD *)&self->_anon_10[48];
  v23 = *(_OWORD *)self->_anon_10;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  do
  {
    *(__int128 *)((char *)&v27 + v11) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*(__int128 *)((char *)&v23 + v11))), v8, *(float32x2_t *)((char *)&v23 + v11), 1), v9, *(float32x4_t *)((char *)&v23 + v11), 2), v10, *(float32x4_t *)((char *)&v23 + v11), 3);
    v11 += 16;
  }
  while (v11 != 64);
  v15 = 0;
  v23 = v27;
  v24 = v28;
  v25 = v29;
  v26 = v30;
  do
  {
    *(__int128 *)((char *)&v27 + v15) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v22, COERCE_FLOAT(*(__int128 *)((char *)&v23 + v15))), v21, *(float32x2_t *)((char *)&v23 + v15), 1), v20, *(float32x4_t *)((char *)&v23 + v15), 2), v19, *(float32x4_t *)((char *)&v23 + v15), 3);
    v15 += 16;
  }
  while (v15 != 64);
  v16 = v28;
  v17 = v29;
  v18 = v30;
  *(_OWORD *)self->_anon_50 = v27;
  *(_OWORD *)&self->_anon_50[16] = v16;
  *(_OWORD *)&self->_anon_50[32] = v17;
  *(_OWORD *)&self->_anon_50[48] = v18;
}

- (__n128)recordedScale
{
  return a1[11];
}

- (void)setRecordedScale:(ARCoachingInstanceTransform *)self
{
  __int128 v2;

  *(_OWORD *)self->_recordedScale = v2;
}

- (__n128)recordedTranslation
{
  return a1[12];
}

- (void)setRecordedTranslation:(ARCoachingInstanceTransform *)self
{
  __int128 v2;

  *(_OWORD *)self->_recordedTranslation = v2;
}

@end
