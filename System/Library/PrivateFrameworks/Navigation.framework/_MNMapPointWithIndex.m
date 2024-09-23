@implementation _MNMapPointWithIndex

- (Matrix<double,)point
{
  double v2;
  double v3;
  Matrix<double, 2, 1> result;

  v2 = self->_point._e[0];
  v3 = self->_point._e[1];
  result._e[1] = v3;
  result._e[0] = v2;
  return result;
}

- (void)setPoint:()Matrix<double
{
  self->_point = a3;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (BOOL)isStartOfSegment
{
  return self->_isStartOfSegment;
}

- (void)setIsStartOfSegment:(BOOL)a3
{
  self->_isStartOfSegment = a3;
}

- (BOOL)isPolylineA
{
  return self->_isPolylineA;
}

- (void)setIsPolylineA:(BOOL)a3
{
  self->_isPolylineA = a3;
}

- (BOOL)isFlipped
{
  return self->_isFlipped;
}

- (void)setIsFlipped:(BOOL)a3
{
  self->_isFlipped = a3;
}

- (LineSegment<double,)segment
{
  double v2;
  double v3;
  double v4;
  double v5;
  LineSegment<double, 2> result;

  v2 = self->_segment._origin._e[0];
  v3 = self->_segment._origin._e[1];
  v4 = self->_segment._direction._e[0];
  v5 = self->_segment._direction._e[1];
  result._direction._e[1] = v5;
  result._direction._e[0] = v4;
  result._origin._e[1] = v3;
  result._origin._e[0] = v2;
  return result;
}

- (void)setSegment:()LineSegment<double
{
  self->_segment = a3;
}

@end
