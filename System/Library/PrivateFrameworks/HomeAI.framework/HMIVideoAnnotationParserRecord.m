@implementation HMIVideoAnnotationParserRecord

- (HMIVideoAnnotationParserRecord)initWithBoundingBox:(CGRect)a3 timeStamp:(double)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  HMIVideoAnnotationParserRecord *result;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)HMIVideoAnnotationParserRecord;
  result = -[HMIVideoAnnotationParserRecord init](&v10, sel_init);
  if (result)
  {
    result->_boundingBox.origin.y = y;
    result->_boundingBox.size.width = width;
    result->_boundingBox.size.height = height;
    result->_timeStamp = a4;
    result->_boundingBox.origin.x = x;
  }
  return result;
}

- (CGRect)boundingBox
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_boundingBox, 32, 1, 0);
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

- (double)timeStamp
{
  return self->_timeStamp;
}

@end
