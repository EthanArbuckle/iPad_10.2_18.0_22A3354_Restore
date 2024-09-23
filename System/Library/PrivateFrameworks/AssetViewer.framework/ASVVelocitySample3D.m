@implementation ASVVelocitySample3D

- (ASVVelocitySample3D)initWithStart:(ASVVelocitySample3D *)self end:(SEL)a2 deltaTime:(double)a3
{
  __int128 v3;
  double v4;
  double v5;
  ASVVelocitySample3D *result;
  __int128 v7;
  __int128 v8;
  objc_super v9;

  v5 = v4;
  v7 = *(_OWORD *)&a3;
  v8 = v3;
  v9.receiver = self;
  v9.super_class = (Class)ASVVelocitySample3D;
  result = -[ASVVelocitySample3D init](&v9, sel_init);
  if (result)
  {
    *(_OWORD *)result->_start = v7;
    *(_OWORD *)result->_end = v8;
    result->_deltaTime = v5;
  }
  return result;
}

- (double)velocity
{
  double v2;
  double v3;
  double result;
  float32x4_t v5;
  float32x4_t v6;
  double v7;
  float32x4_t v8;
  float32x4_t v9;

  objc_msgSend(a1, "deltaTime");
  v3 = v2;
  result = 0.0;
  if (v3 >= 0.00000011920929)
  {
    objc_msgSend(a1, "end", 0.0);
    v8 = v5;
    objc_msgSend(a1, "start");
    v9 = vsubq_f32(v8, v6);
    objc_msgSend(a1, "deltaTime");
    *(float *)&v7 = v7;
    *(_QWORD *)&result = vdivq_f32(v9, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v7, 0)).u64[0];
  }
  return result;
}

- (double)calcFinalVelocityFromPreviousSample:(void *)a3
{
  double result;

  *(_QWORD *)&result = _Z28calcFinalVelocityFromSamplesIDv3_f19ASVVelocitySample3DET_PT0_S4_(a1, a3).n128_u64[0];
  return result;
}

- (double)start
{
  __int128 v2;

  objc_copyStruct(&v2, (const void *)(a1 + 16), 16, 1, 0);
  return *(double *)&v2;
}

- (void)setStart:(ASVVelocitySample3D *)self
{
  __int128 v2;
  __int128 v3;

  v3 = v2;
  objc_copyStruct(self->_start, &v3, 16, 1, 0);
}

- (double)end
{
  __int128 v2;

  objc_copyStruct(&v2, (const void *)(a1 + 32), 16, 1, 0);
  return *(double *)&v2;
}

- (void)setEnd:(ASVVelocitySample3D *)self
{
  __int128 v2;
  __int128 v3;

  v3 = v2;
  objc_copyStruct(self->_end, &v3, 16, 1, 0);
}

- (double)deltaTime
{
  return self->_deltaTime;
}

- (void)setDeltaTime:(double)a3
{
  self->_deltaTime = a3;
}

@end
