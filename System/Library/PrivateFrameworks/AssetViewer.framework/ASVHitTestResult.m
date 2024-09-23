@implementation ASVHitTestResult

- (ASVHitTestResult)initWithType:(int64_t)a3 worldPosition:imagePoint:assetPosition:cameraPosition:
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  ASVHitTestResult *result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;

  v11 = v5;
  v12 = v6;
  v7 = v4;
  v10 = v3;
  v13.receiver = self;
  v13.super_class = (Class)ASVHitTestResult;
  result = -[ASVHitTestResult init](&v13, sel_init);
  if (result)
  {
    result->_type = a3;
    *(_QWORD *)result->_imagePoint = v7;
    *(_OWORD *)result->_worldPosition = v10;
    *(_OWORD *)result->_assetPosition = v11;
    *(_OWORD *)result->_cameraPosition = v12;
    *(_OWORD *)result->_synthesizedPlaneNormal = kASVInvalidPosition;
  }
  return result;
}

- (float)distanceFromAsset
{
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v8;

  -[ASVHitTestResult assetPosition](self, "assetPosition");
  if ((ASVPositionIsValid() & 1) == 0)
    return -1.0;
  -[ASVHitTestResult assetPosition](self, "assetPosition");
  v8 = v3;
  -[ASVHitTestResult worldPosition](self, "worldPosition");
  v5 = vsubq_f32(v8, v4);
  v6 = vmulq_f32(v5, v5);
  return sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v6, 2), vaddq_f32(v6, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v6.f32, 1))).f32[0]);
}

- (float)distanceFromCamera
{
  float32x4_t v2;
  float32x4_t v3;

  -[ASVHitTestResult cameraToPosition](self, "cameraToPosition");
  v3 = vmulq_f32(v2, v2);
  return sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v3, 2), vaddq_f32(v3, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v3.f32, 1))).f32[0]);
}

- (double)cameraToPosition
{
  float32x4_t v2;
  float32x4_t v3;
  double result;
  float32x4_t v5;

  objc_msgSend(a1, "worldPosition");
  v5 = v2;
  objc_msgSend(a1, "cameraPosition");
  *(_QWORD *)&result = vsubq_f32(v5, v3).u64[0];
  return result;
}

- (BOOL)isRealPlane
{
  return -[ASVHitTestResult type](self, "type") == 2 || -[ASVHitTestResult type](self, "type") == 1;
}

- (BOOL)isSynthesizedVeritcalPlane
{
  float32x4_t v2;

  if (self->_type != 3)
    return 0;
  v2 = vmulq_f32(*(float32x4_t *)self->_synthesizedPlaneNormal, (float32x4_t)xmmword_1D94E1CC0);
  return acosf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v2, 2), vaddq_f32(v2, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v2.f32, 1))).f32[0]) > 0.785398163;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (__n128)worldPosition
{
  return a1[2];
}

- (__n128)assetPosition
{
  return a1[3];
}

- (__n128)cameraPosition
{
  return a1[4];
}

- (double)imagePoint
{
  return *(double *)(a1 + 16);
}

- (__n128)synthesizedPlaneNormal
{
  return a1[5];
}

- (void)setSynthesizedPlaneNormal:(ASVHitTestResult *)self
{
  __int128 v2;

  *(_OWORD *)self->_synthesizedPlaneNormal = v2;
}

@end
