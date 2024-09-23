@implementation GEOPathMatcherInternalInfo

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

- (NSString)base64Path
{
  return self->_base64Path;
}

- (NSArray)matchedSegments
{
  return self->_matchedSegments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchedSegments, 0);
  objc_storeStrong((id *)&self->_base64Path, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0xBF80000000000000;
  *((_QWORD *)self + 4) = 0xBF80000000000000;
  return self;
}

@end
