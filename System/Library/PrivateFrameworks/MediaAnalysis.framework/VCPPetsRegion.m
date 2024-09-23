@implementation VCPPetsRegion

- (VCPPetsRegion)initWith:(CGRect)a3 confidence:(float)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  VCPPetsRegion *result;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)VCPPetsRegion;
  result = -[VCPPetsRegion init](&v10, sel_init);
  if (result)
  {
    result->_bound.origin.x = x;
    result->_bound.origin.y = y;
    result->_bound.size.width = width;
    result->_bound.size.height = height;
    result->_confidence = a4;
  }
  return result;
}

- (CGRect)bound
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_bound, 32, 1, 0);
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

- (void)setBound:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_bound, &v3, 32, 1, 0);
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
