@implementation AXVNEspressoDetectedObject

- (AXVNEspressoDetectedObject)initWithObjectType:(int64_t)a3 boundingBox:(CGRect)a4 confidence:(float)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  AXVNEspressoDetectedObject *v11;
  AXVNEspressoDetectedObject *v12;
  AXVNEspressoDetectedObject *v13;
  objc_super v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)AXVNEspressoDetectedObject;
  v11 = -[AXVNEspressoDetectedObject init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_objectType = a3;
    v11->_bounds.origin.x = x;
    v11->_bounds.origin.y = y;
    v11->_bounds.size.width = width;
    v11->_bounds.size.height = height;
    v11->_confidence = a5;
    v13 = v11;
  }

  return v12;
}

- (CGPoint)center
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[AXVNEspressoDetectedObject bounds](self, "bounds");
  v4 = v3 + v2 * 0.5;
  v7 = v6 + v5 * 0.5;
  result.y = v7;
  result.x = v4;
  return result;
}

- (int64_t)objectType
{
  return self->_objectType;
}

- (void)setObjectType:(int64_t)a3
{
  self->_objectType = a3;
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_bounds, 32, 1, 0);
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
  objc_copyStruct(&self->_bounds, &v3, 32, 1, 0);
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

@end
