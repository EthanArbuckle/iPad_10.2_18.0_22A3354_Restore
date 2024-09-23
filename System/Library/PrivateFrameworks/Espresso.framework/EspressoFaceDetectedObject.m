@implementation EspressoFaceDetectedObject

- (EspressoFaceDetectedObject)initWithOptionsXloc:(float)a3 yloc:(float)a4 size:(float)a5 confidence:(float)a6
{
  EspressoFaceDetectedObject *result;
  CGFloat v11;
  float v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)EspressoFaceDetectedObject;
  result = -[EspressoFaceDetectedObject init](&v13, sel_init);
  if (result)
  {
    result->bounds.origin.x = (float)(a3 - a5);
    result->bounds.origin.y = (float)(a4 - a5);
    v11 = a5 + a5;
    result->bounds.size.width = v11;
    result->bounds.size.height = v11;
    result->center.x = a3;
    result->center.y = a4;
    v12 = 1.0;
    if (a6 <= 1.0)
      v12 = a6;
    result->confidence = v12;
  }
  return result;
}

- (int64_t)objectType
{
  return self->objectType;
}

- (void)setObjectType:(int64_t)a3
{
  self->objectType = a3;
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->bounds, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->bounds, &v3, 32, 1, 0);
}

- (CGPoint)center
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->center, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->center, &v3, 16, 1, 0);
}

- (float)confidence
{
  return self->confidence;
}

- (void)setConfidence:(float)a3
{
  self->confidence = a3;
}

@end
