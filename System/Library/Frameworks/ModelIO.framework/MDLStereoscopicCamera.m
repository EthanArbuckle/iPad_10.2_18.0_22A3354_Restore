@implementation MDLStereoscopicCamera

- (MDLStereoscopicCamera)init
{
  MDLStereoscopicCamera *v2;
  MDLStereoscopicCamera *v3;
  MDLStereoscopicCamera *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MDLStereoscopicCamera;
  v2 = -[MDLCamera init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_interPupillaryDistance = 63.0;
    v4 = v2;
  }

  return v3;
}

- (matrix_float4x4)leftViewMatrix
{
  double v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  matrix_float4x4 result;

  v2 = sub_1DCBC1D74((uint64_t)self->super._camera, (float)(self->_interPupillaryDistance * -0.01) / self->super._worldToMetersConversionScale);
  result.columns[3].i64[1] = v9;
  result.columns[3].i64[0] = v8;
  result.columns[2].i64[1] = v7;
  result.columns[2].i64[0] = v6;
  result.columns[1].i64[1] = v5;
  result.columns[1].i64[0] = v4;
  result.columns[0].i64[1] = v3;
  *(double *)result.columns[0].i64 = v2;
  return result;
}

- (matrix_float4x4)rightViewMatrix
{
  double v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  matrix_float4x4 result;

  v2 = sub_1DCBC1D74((uint64_t)self->super._camera, (float)(self->_interPupillaryDistance * 0.01) / self->super._worldToMetersConversionScale);
  result.columns[3].i64[1] = v9;
  result.columns[3].i64[0] = v8;
  result.columns[2].i64[1] = v7;
  result.columns[2].i64[0] = v6;
  result.columns[1].i64[1] = v5;
  result.columns[1].i64[0] = v4;
  result.columns[0].i64[1] = v3;
  *(double *)result.columns[0].i64 = v2;
  return result;
}

- (matrix_float4x4)leftProjectionMatrix
{
  float v2;
  float v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  matrix_float4x4 result;

  v2 = sub_1DCBC1DB8((uint64_t)self->super._camera, (float)(self->_interPupillaryDistance * -0.01) / self->super._worldToMetersConversionScale);
  result.columns[3].i64[1] = v10;
  result.columns[3].i64[0] = v9;
  result.columns[2].i64[1] = v8;
  result.columns[2].i64[0] = v7;
  result.columns[1].i64[1] = v6;
  result.columns[1].i64[0] = v5;
  result.columns[0].i64[1] = v4;
  result.columns[0].f32[1] = v3;
  result.columns[0].f32[0] = v2;
  return result;
}

- (matrix_float4x4)rightProjectionMatrix
{
  float v2;
  float v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  matrix_float4x4 result;

  v2 = sub_1DCBC1DB8((uint64_t)self->super._camera, (float)(self->_interPupillaryDistance * 0.01) / self->super._worldToMetersConversionScale);
  result.columns[3].i64[1] = v10;
  result.columns[3].i64[0] = v9;
  result.columns[2].i64[1] = v8;
  result.columns[2].i64[0] = v7;
  result.columns[1].i64[1] = v6;
  result.columns[1].i64[0] = v5;
  result.columns[0].i64[1] = v4;
  result.columns[0].f32[1] = v3;
  result.columns[0].f32[0] = v2;
  return result;
}

- (float)interPupillaryDistance
{
  return self->_interPupillaryDistance;
}

- (void)setInterPupillaryDistance:(float)interPupillaryDistance
{
  self->_interPupillaryDistance = interPupillaryDistance;
}

- (float)leftVergence
{
  return self->_leftVergence;
}

- (void)setLeftVergence:(float)leftVergence
{
  self->_leftVergence = leftVergence;
}

- (float)rightVergence
{
  return self->_rightVergence;
}

- (void)setRightVergence:(float)rightVergence
{
  self->_rightVergence = rightVergence;
}

- (float)overlap
{
  return self->_overlap;
}

- (void)setOverlap:(float)overlap
{
  self->_overlap = overlap;
}

@end
