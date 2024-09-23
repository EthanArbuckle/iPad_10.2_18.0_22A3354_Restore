@implementation VNEspressoDetectedObject

- (VNEspressoDetectedObject)initWithObjectType:(int64_t)a3 boundingBox:(CGRect)a4 confidence:(float)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  VNEspressoDetectedObject *v11;
  VNEspressoDetectedObject *v12;
  VNEspressoDetectedObject *v13;
  objc_super v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)VNEspressoDetectedObject;
  v11 = -[VNEspressoDetectedObject init](&v15, sel_init);
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

  -[VNEspressoDetectedObject bounds](self, "bounds");
  v4 = v3 + v2 * 0.5;
  v7 = v6 + v5 * 0.5;
  result.y = v7;
  result.x = v4;
  return result;
}

- (id)description
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  int64_t v9;
  float v10;
  void *v11;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[VNEspressoDetectedObject bounds](self, "bounds");
  VNHumanReadableCGRect(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[VNEspressoDetectedObject objectType](self, "objectType");
  -[VNEspressoDetectedObject confidence](self, "confidence");
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("Bounding Box = %@; objectType = %ld; confidence = %f"),
                  v8,
                  v9,
                  v10);

  return v11;
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
