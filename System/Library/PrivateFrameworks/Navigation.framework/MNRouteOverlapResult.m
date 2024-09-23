@implementation MNRouteOverlapResult

- (id)description
{
  void *v3;
  unint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t j;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSUUID *routeID;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[GEOPolylineCoordinateRangeArray count](self->_overlapRanges, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < -[GEOPolylineCoordinateRangeArray count](self->_overlapRanges, "count"); ++i)
  {
    -[GEOPolylineCoordinateRangeArray coordinateRangeAtIndex:](self->_overlapRanges, "coordinateRangeAtIndex:", i);
    v5 = (void *)MEMORY[0x1E0CB3940];
    GEOPolylineCoordinateRangeAsString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("{%@}"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[GEOPolylineCoordinateRangeArray count](self->_uniqueRanges, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  for (j = 0; j < -[GEOPolylineCoordinateRangeArray count](self->_uniqueRanges, "count"); ++j)
  {
    -[GEOPolylineCoordinateRangeArray coordinateRangeAtIndex:](self->_uniqueRanges, "coordinateRangeAtIndex:", j);
    v10 = (void *)MEMORY[0x1E0CB3940];
    GEOPolylineCoordinateRangeAsString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("{%@}"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v12);

  }
  v13 = (void *)MEMORY[0x1E0CB3940];
  routeID = self->_routeID;
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("Route ID: %@\n    Overlap: %@\n    Unique: %@"), routeID, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSUUID)routeID
{
  return self->_routeID;
}

- (void)setRouteID:(id)a3
{
  objc_storeStrong((id *)&self->_routeID, a3);
}

- (GEOPolylineCoordinateRange)routeRange
{
  PolylineCoordinate end;
  PolylineCoordinate start;
  GEOPolylineCoordinateRange result;

  end = self->_routeRange.end;
  start = self->_routeRange.start;
  result.end = end;
  result.start = start;
  return result;
}

- (void)setRouteRange:(GEOPolylineCoordinateRange)a3
{
  self->_routeRange = a3;
}

- (GEOPolylineCoordinateRangeArray)overlapRanges
{
  return self->_overlapRanges;
}

- (void)setOverlapRanges:(id)a3
{
  objc_storeStrong((id *)&self->_overlapRanges, a3);
}

- (GEOPolylineCoordinateRangeArray)uniqueRanges
{
  return self->_uniqueRanges;
}

- (void)setUniqueRanges:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueRanges, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueRanges, 0);
  objc_storeStrong((id *)&self->_overlapRanges, 0);
  objc_storeStrong((id *)&self->_routeID, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0xBF80000000000000;
  *((_QWORD *)self + 5) = 0xBF80000000000000;
  return self;
}

@end
