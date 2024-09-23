@implementation PHASEEnvelopeSegment

- (PHASEEnvelopeSegment)init
{
  PHASEEnvelopeSegment *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHASEEnvelopeSegment;
  result = -[PHASEEnvelopeSegment init](&v3, sel_init);
  if (result)
  {
    *(_QWORD *)result->_endPoint = 0;
    *(_QWORD *)&result->_endPoint[8] = 0;
    result->_curveType = 1668435054;
  }
  return result;
}

- (PHASEEnvelopeSegment)initWithEndPoint:(simd_double2)endPoint curveType:(PHASECurveType)curveType
{
  PHASEEnvelopeSegment *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PHASEEnvelopeSegment;
  result = -[PHASEEnvelopeSegment init](&v7, sel_init);
  if (result)
  {
    *(simd_double2 *)result->_endPoint = endPoint;
    result->_curveType = curveType;
  }
  return result;
}

- (simd_double2)endPoint
{
  return *(simd_double2 *)self->_endPoint;
}

- (void)setEndPoint:(simd_double2)endPoint
{
  *(simd_double2 *)self->_endPoint = endPoint;
}

- (PHASECurveType)curveType
{
  return self->_curveType;
}

- (void)setCurveType:(PHASECurveType)curveType
{
  self->_curveType = curveType;
}

@end
