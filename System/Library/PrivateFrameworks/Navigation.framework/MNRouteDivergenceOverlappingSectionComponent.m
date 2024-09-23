@implementation MNRouteDivergenceOverlappingSectionComponent

- (unint64_t)routeIndex
{
  return self->_routeIndex;
}

- (void)setRouteIndex:(unint64_t)a3
{
  self->_routeIndex = a3;
}

- (GEOPolylineCoordinateRange)range
{
  PolylineCoordinate end;
  PolylineCoordinate start;
  GEOPolylineCoordinateRange result;

  end = self->_range.end;
  start = self->_range.start;
  result.end = end;
  result.start = start;
  return result;
}

- (void)setRange:(GEOPolylineCoordinateRange)a3
{
  self->_range = a3;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0xBF80000000000000;
  *((_QWORD *)self + 3) = 0xBF80000000000000;
  return self;
}

@end
