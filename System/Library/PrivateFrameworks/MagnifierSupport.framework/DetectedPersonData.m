@implementation DetectedPersonData

- (DetectedPersonData)initWithMinPosition:(DetectedPersonData *)self maxPosition:(SEL)a2 screenRect:(CGRect)a3
{
  double v3;
  double v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat height;
  CGFloat width;
  DetectedPersonData *v9;
  DetectedPersonData *v10;
  uint32x4_t v11;
  NSValue *face;
  int32x4_t v14;
  CGPoint origin;
  objc_super v16;

  v5 = v4;
  v6 = v3;
  height = a3.size.height;
  width = a3.size.width;
  v14 = *(int32x4_t *)&a3.origin.y;
  origin = a3.origin;
  v16.receiver = self;
  v16.super_class = (Class)DetectedPersonData;
  v9 = -[DetectedPersonData init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    *(CGPoint *)v9->_minPosition = origin;
    *(int32x4_t *)v9->_maxPosition = v14;
    v11 = (uint32x4_t)vaddq_s32(v14, (int32x4_t)origin);
    *(int32x4_t *)v9->_position = vshrq_n_s32((int32x4_t)vsraq_n_u32(v11, v11, 0x1FuLL), 1uLL);
    v9->_screenRect.origin.x = width;
    v9->_screenRect.origin.y = height;
    v9->_screenRect.size.width = v6;
    v9->_screenRect.size.height = v5;
    v9->_isEnabled = 1;
    face = v9->_face;
    v9->_face = 0;

  }
  return v10;
}

- (DetectedPersonData)initWithNormalizedMinX:(double)a3 maxX:(double)a4 minY:(double)a5 maxY:(double)a6 depth:(float)a7 camera:(id)a8 orientation:(int64_t)a9
{
  id v16;
  DetectedPersonData *v17;
  __int128 v18;
  float32x2_t v19;
  int32x4_t v20;
  float32x2_t v21;
  int32x4_t v22;
  uint32x4_t v23;
  DetectedPersonData *v24;
  __int128 v26;
  objc_super v27;

  v16 = a8;
  v27.receiver = self;
  v27.super_class = (Class)DetectedPersonData;
  v17 = -[DetectedPersonData init](&v27, sel_init);
  if (v17)
  {
    objc_msgSend(v16, "unprojectPoint:ontoPlaneWithTransform:orientation:viewportSize:", a9, a3, a5);
    v26 = v18;
    objc_msgSend(v16, "unprojectPoint:ontoPlaneWithTransform:orientation:viewportSize:", a9, a4, a6, *(double *)&_PromotedConst, 0.0, -0.0078125, 0.0, 1.0, 1.0);
    v19 = (float32x2_t)vdup_n_s32(0x447A0000u);
    v20.i32[3] = HIDWORD(v26);
    *(int32x2_t *)v20.i8 = vcvt_s32_f32(vmul_f32(*(float32x2_t *)&v26, v19));
    v20.i32[2] = (int)(float)(a7 * 1000.0);
    *(int32x2_t *)v22.i8 = vcvt_s32_f32(vmul_f32(v21, v19));
    v22.i32[2] = v20.i32[2];
    *(int32x4_t *)v17->_minPosition = v20;
    *(int32x4_t *)v17->_maxPosition = v22;
    v23 = (uint32x4_t)vaddq_s32(v22, v20);
    *(int32x4_t *)v17->_position = vshrq_n_s32((int32x4_t)vsraq_n_u32(v23, v23, 0x1FuLL), 1uLL);
    v17->_screenRect.origin.x = a3;
    v17->_screenRect.origin.y = a5;
    v17->_screenRect.size.width = a4 - a3;
    v17->_screenRect.size.height = a6 - a5;
    v17->_isEnabled = 1;
    v24 = v17;
  }

  return v17;
}

+ (DetectedPersonData)InvalidPersonData
{
  if (+[DetectedPersonData InvalidPersonData]::onceToken != -1)
    dispatch_once(&+[DetectedPersonData InvalidPersonData]::onceToken, &__block_literal_global_0);
  return (DetectedPersonData *)(id)+[DetectedPersonData InvalidPersonData]::invalidPersonData;
}

uint64_t __39__DetectedPersonData_InvalidPersonData__block_invoke()
{
  DetectedPersonData *v0;
  uint64_t v1;
  void *v2;

  v0 = [DetectedPersonData alloc];
  v1 = -[DetectedPersonData initWithMinPosition:maxPosition:screenRect:](v0, "initWithMinPosition:maxPosition:screenRect:", 0.0, 0.0, *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24));
  v2 = (void *)+[DetectedPersonData InvalidPersonData]::invalidPersonData;
  +[DetectedPersonData InvalidPersonData]::invalidPersonData = v1;

  return objc_msgSend((id)+[DetectedPersonData InvalidPersonData]::invalidPersonData, "setIsEnabled:", 0);
}

- (BOOL)isValid
{
  DetectedPersonData *v3;

  +[DetectedPersonData InvalidPersonData](DetectedPersonData, "InvalidPersonData");
  v3 = (DetectedPersonData *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v3 != self;

  return (char)self;
}

- (unint64_t)computeArea
{
  int32x2_t v2;

  v2 = vsub_s32(*(int32x2_t *)self->_maxPosition, *(int32x2_t *)self->_minPosition);
  return vmul_lane_s32(v2, v2, 1).i32[0];
}

- (__n128)position
{
  return a1[2];
}

- (__n128)minPosition
{
  return a1[3];
}

- (__n128)maxPosition
{
  return a1[4];
}

- (CGRect)screenRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_screenRect.origin.x;
  y = self->_screenRect.origin.y;
  width = self->_screenRect.size.width;
  height = self->_screenRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (NSValue)face
{
  return self->_face;
}

- (void)setFace:(id)a3
{
  objc_storeStrong((id *)&self->_face, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_face, 0);
}

@end
