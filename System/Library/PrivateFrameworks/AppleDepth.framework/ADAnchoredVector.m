@implementation ADAnchoredVector

- (ADAnchoredVector)vectorByChangingPOV:(float32x4_t)a3
{
  return +[ADAnchoredVector vectorWithOrigin:direction:](ADAnchoredVector, "vectorWithOrigin:direction:", *(double *)vaddq_f32(a5, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(_OWORD *)a1[2].f32)), a3, a1[2], 1), a4, *(float32x4_t *)a1[2].f32, 2)).i64, *(double *)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(_OWORD *)a1[4].f32)), a3, a1[4], 1), a4, *(float32x4_t *)a1[4].f32, 2).i64);
}

- (double)intersectWithPlane:(float32x4_t)a3 normal:
{
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  float32x4_t v9;
  float32x4_t v10;
  float v11;
  double result;
  __int16 v13;
  __int16 v14;

  v3 = a1[2];
  v4 = vmulq_f32(v3, a3);
  v5 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v4, 2), vaddq_f32(v4, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v4.f32, 1)));
  if (fabsf(v5.f32[0]) < 0.00000011921)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v14 = 0;
      v6 = MEMORY[0x24BDACB70];
      v7 = "cannot find intersection: ray is perpendicular to plane normal";
      v8 = (uint8_t *)&v14;
LABEL_10:
      _os_log_error_impl(&dword_20B62B000, v6, OS_LOG_TYPE_ERROR, v7, v8, 2u);
      return 0.0;
    }
    return 0.0;
  }
  v9 = a1[1];
  v10 = vmulq_f32(vsubq_f32(a2, v9), a3);
  v11 = vdivq_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v10, 2), vaddq_f32(v10, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v10.f32, 1))), v5).f32[0];
  if (v11 < 0.0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v13 = 0;
      v6 = MEMORY[0x24BDACB70];
      v7 = "cannot find intersection: plane is behind ray origin";
      v8 = (uint8_t *)&v13;
      goto LABEL_10;
    }
    return 0.0;
  }
  *(_QWORD *)&result = vmlaq_n_f32(v9, v3, v11).u64[0];
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("origin:[%.3f,%.3f,%.3f] direction:[%.3f,%.3f,%.3f]"), *(float *)self->_origin, *(float *)&self->_origin[4], *(float *)&self->_origin[8], *(float *)self->_direction, *(float *)&self->_direction[4], *(float *)&self->_direction[8]);
}

- (__n128)origin
{
  return a1[1];
}

- (void)setOrigin:(ADAnchoredVector *)self
{
  __int128 v2;

  *(_OWORD *)self->_origin = v2;
}

- (__n128)direction
{
  return a1[2];
}

- (void)setDirection:(ADAnchoredVector *)self
{
  __int128 v2;

  *(_OWORD *)self->_direction = v2;
}

+ (id)vectorWithOrigin:(id)a1 direction:(SEL)a2
{
  double v2;
  double v3;
  void *v4;
  double v6;
  double v7;

  v6 = v3;
  v7 = v2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setOrigin:", v7);
  objc_msgSend(v4, "setDirection:", v6);
  return v4;
}

+ (id)vectorWithTransform:(double)a3
{
  void *v4;
  void *v5;

  +[ADAnchoredVector vectorWithOrigin:direction:](ADAnchoredVector, "vectorWithOrigin:direction:", 0.0, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vectorByChangingPOV:", a1, a2, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
