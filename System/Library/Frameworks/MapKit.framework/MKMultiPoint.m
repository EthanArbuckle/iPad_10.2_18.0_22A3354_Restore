@implementation MKMultiPoint

- (id)_initWithGeoJSONObject:(id)a3 error:(id *)a4
{
  id v6;
  MKMultiPoint *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char *VerticesFromGeoJSON;
  MKMultiPoint *v12;
  __CFString *v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MKMultiPoint;
  v7 = -[MKMultiPoint init](&v15, sel_init);
  if (!v7)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      v13 = CFSTR("MultiPoint object must be a dictionary");
LABEL_10:
      _errorWithReason(v13);
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
LABEL_11:
    v12 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = _geoJSONGeometryType((uint64_t)v8);

  if (v9 != 2)
  {
    if (a4)
    {
      v13 = CFSTR("Input is not a MultiPoint GeoJSON object");
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("coordinates"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  VerticesFromGeoJSON = _createVerticesFromGeoJSON(v10, a4);
  if (VerticesFromGeoJSON)
  {
    -[MKMultiPoint _assignPoints:count:](v7, "_assignPoints:count:", VerticesFromGeoJSON, objc_msgSend(v10, "count"));
    v12 = v7;
  }
  else
  {
    v12 = 0;
  }

LABEL_14:
  return v12;
}

- (void)dealloc
{
  $F24F406B2B787EFB06265DBA3D28CBD5 *points;
  objc_super v4;

  points = self->_points;
  if (points)
    free(points);
  v4.receiver = self;
  v4.super_class = (Class)MKMultiPoint;
  -[MKMultiPoint dealloc](&v4, sel_dealloc);
}

- (MKMapPoint)points
{
  return (MKMapPoint *)self->_points;
}

- (double)elevations
{
  return self->_elevations;
}

- ($FD2884BA735A6398BD92EEF91FE53E55)boundingMapRect
{
  double x;
  double y;
  double width;
  double height;
  $FD2884BA735A6398BD92EEF91FE53E55 result;

  x = self->_boundingRect.origin.x;
  y = self->_boundingRect.origin.y;
  width = self->_boundingRect.size.width;
  height = self->_boundingRect.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- (void)_setBounds:(id)a3
{
  self->_boundingRect = ($8D326A409DE759287A73E3EC6ECA4C4F)a3;
}

- (void)_calculateBounds
{
  double v3;
  double v4;
  double v5;

  self->_boundingRect.origin.x = MKMapRectBoundingMapPoints((uint64_t)self->_points, self->_pointCount);
  self->_boundingRect.origin.y = v3;
  self->_boundingRect.size.width = v4;
  self->_boundingRect.size.height = v5;
}

- (void)_wrapAroundTheDateline:(const CLLocationCoordinate2D *)a3 elevations:(const double *)a4 count:(unint64_t)a5
{
  uint64_t v9;
  uint64_t v10;
  CLLocationDegrees *p_longitude;
  double v12;
  double longitude;
  double v14;
  $F24F406B2B787EFB06265DBA3D28CBD5 *v15;
  double v16;
  double *elevations;

  if (a5)
  {
    v9 = 0;
    v10 = 0;
    p_longitude = &a3->longitude;
    v12 = 0.0;
    do
    {
      longitude = a3[v9].longitude;
      if (vabdd_f64(longitude, *p_longitude) > 180.0)
      {
        if (longitude < *p_longitude)
          v12 = v12 + 268435456.0;
        else
          v12 = v12 + -268435456.0;
      }
      v14 = MKTilePointForCoordinate(a3[v9].latitude, longitude, 21.0);
      v15 = &self->_points[v9];
      v15->var0 = v12 + v14;
      v15->var1 = v16;
      if (a4)
      {
        elevations = self->_elevations;
        if (elevations)
          elevations[v10] = a4[v10];
      }
      p_longitude = &a3[v10++].longitude;
      ++v9;
    }
    while (a5 != v10);
  }
}

- (void)_setCoordinates:(const CLLocationCoordinate2D *)a3 elevations:(const double *)a4 count:(unint64_t)a5
{
  $F24F406B2B787EFB06265DBA3D28CBD5 *points;
  double *elevations;

  points = self->_points;
  if (points)
  {
    free(points);
    self->_points = 0;
  }
  elevations = self->_elevations;
  if (elevations)
  {
    free(elevations);
    self->_elevations = 0;
  }
  self->_pointCount = a5;
  if (a5)
  {
    self->_points = ($F24F406B2B787EFB06265DBA3D28CBD5 *)malloc_type_malloc(16 * a5, 0xDD01F056uLL);
    if (a4)
      self->_elevations = (double *)malloc_type_malloc(8 * a5, 0x100004000313F17uLL);
    -[MKMultiPoint _wrapAroundTheDateline:elevations:count:](self, "_wrapAroundTheDateline:elevations:count:", a3, a4, a5);
  }
  else
  {
    self->_points = 0;
    self->_elevations = 0;
  }
  -[MKMultiPoint _calculateBounds](self, "_calculateBounds");
  -[MKMultiPoint _pointsDidChange](self, "_pointsDidChange");
}

- (void)_setCoordinates:(const CLLocationCoordinate2D *)a3 count:(unint64_t)a4
{
  -[MKMultiPoint _setCoordinates:elevations:count:](self, "_setCoordinates:elevations:count:", a3, 0, a4);
}

- (void)_setPoints:(id *)a3 count:(unint64_t)a4
{
  $F24F406B2B787EFB06265DBA3D28CBD5 *points;
  $F24F406B2B787EFB06265DBA3D28CBD5 *v8;
  id v9;

  points = self->_points;
  if (points)
  {
    free(points);
    self->_points = 0;
  }
  if (a4 >> 60)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
  }
  v8 = ($F24F406B2B787EFB06265DBA3D28CBD5 *)malloc_type_malloc(16 * a4, 0x9C532C01uLL);
  self->_points = v8;
  memcpy(v8, a3, 16 * a4);
  self->_pointCount = a4;
  -[MKMultiPoint _calculateBounds](self, "_calculateBounds");
  -[MKMultiPoint _pointsDidChange](self, "_pointsDidChange");
}

- (void)_assignPoints:(id *)a3 count:(unint64_t)a4
{
  self->_points = a3;
  self->_pointCount = a4;
  -[MKMultiPoint _calculateBounds](self, "_calculateBounds");
  -[MKMultiPoint _pointsDidChange](self, "_pointsDidChange");
}

- (void)getCoordinates:(CLLocationCoordinate2D *)coords range:(NSRange)range
{
  unint64_t pointCount;
  unint64_t v5;
  NSUInteger length;
  NSUInteger v8;
  NSUInteger location;
  CLLocationDegrees *p_longitude;

  pointCount = self->_pointCount;
  v5 = pointCount - range.location;
  if (pointCount > range.location)
  {
    length = range.length;
    v8 = 0;
    location = range.location;
    p_longitude = &coords->longitude;
    do
    {
      if (v8 >= length)
        break;
      *(CLLocationCoordinate2D *)(p_longitude - 1) = MKCoordinateForMapPoint((MKMapPoint)self->_points[location]);
      ++v8;
      ++location;
      p_longitude += 2;
    }
    while (v5 != v8);
  }
}

- (CLLocationCoordinate2D)coordinate
{
  MKMapPoint v7;
  double y;
  double latitude;
  double longitude;
  CLLocationCoordinate2D v11;
  CLLocationCoordinate2D result;

  __asm { FMOV            V2.2D, #0.5 }
  v7 = (MKMapPoint)vaddq_f64((float64x2_t)self->_boundingRect.origin, vmulq_f64((float64x2_t)self->_boundingRect.size, _Q2));
  y = v7.y;
  v11 = MKCoordinateForMapPoint(v7);
  longitude = v11.longitude;
  latitude = v11.latitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (BOOL)intersectsMapRect:(id)a3
{
  return MKMapRectIntersectsMapRectWrappingMeridian(self->_boundingRect.origin.x, self->_boundingRect.origin.y, self->_boundingRect.size.width, self->_boundingRect.size.height, a3.var0.var0, a3.var0.var1, a3.var1.var0, a3.var1.var1);
}

- (MKMultiPoint)initWithCoder:(id)a3
{
  id v4;
  MKMultiPoint *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  MKMultiPoint *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v15;
  objc_super v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MKMultiPoint;
  v5 = -[MKShape initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MKMultiPointPointCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntegerValue");
    v15 = 0;
    v8 = objc_retainAutorelease(v4);
    v9 = objc_msgSend(v8, "decodeBytesForKey:returnedLength:", CFSTR("MKMultiPointPoints"), &v15);
    if (!v9 || v7 != v15 >> 4)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0C9AFA8];
      v18[0] = CFSTR("points bytes were not the expected length");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1, v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4864, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "failWithError:", v13);

      v10 = 0;
      goto LABEL_7;
    }
    -[MKMultiPoint _setPoints:count:](v5, "_setPoints:count:", v9, v7);

  }
  v10 = v5;
LABEL_7:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  unint64_t pointCount;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MKMultiPoint;
  -[MKShape encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_pointCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("MKMultiPointPointCount"));

  pointCount = self->_pointCount;
  if (pointCount)
    objc_msgSend(v4, "encodeBytes:length:forKey:", self->_points, 16 * pointCount, CFSTR("MKMultiPointPoints"));

}

- (double)_mapPointsLength
{
  GEOOnce();
  return self->_mapPointsLength;
}

uint64_t __32__MKMultiPoint__mapPointsLength__block_invoke(uint64_t a1)
{
  double *v2;
  uint64_t result;
  uint64_t v4;
  double v5;
  double v6;
  double *v7;
  double v8;
  double v9;
  double v10;

  v2 = (double *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "points");
  result = objc_msgSend(*(id *)(a1 + 32), "pointCount");
  v4 = result - 1;
  if (result == 1)
  {
    v8 = 0.0;
  }
  else
  {
    v6 = *v2;
    v5 = v2[1];
    v7 = v2 + 3;
    v8 = 0.0;
    do
    {
      v9 = *(v7 - 1);
      v10 = *v7;
      v8 = v8 + sqrt((*v7 - v5) * (*v7 - v5) + (v9 - v6) * (v9 - v6));
      v7 += 2;
      v5 = v10;
      v6 = v9;
      --v4;
    }
    while (v4);
  }
  *(double *)(*(_QWORD *)(a1 + 32) + 88) = v8;
  return result;
}

- (BOOL)_isSelfIntersecting
{
  GEOOnce();
  return self->_selfIntersecting;
}

uint64_t __35__MKMultiPoint__isSelfIntersecting__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_determineSelfIntersecting");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 104) = result;
  return result;
}

- (BOOL)_determineSelfIntersecting
{
  MKMultiPoint *v2;
  uint64_t v3;
  unint64_t v4;
  char isSelf;
  unint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  void *__p;
  char *v19;
  char *v20;

  v2 = objc_retainAutorelease(self);
  v3 = -[MKMultiPoint points](v2, "points");
  v4 = -[MKMultiPoint pointCount](v2, "pointCount");
  if (v4 < 3)
    return 0;
  v6 = v4;
  __p = 0;
  v19 = 0;
  v20 = 0;
  std::vector<gm::Matrix<double,2,1>>::reserve(&__p, v4);
  v7 = 0;
  v8 = v19;
  do
  {
    if (v8 >= v20)
    {
      v10 = (char *)__p;
      v11 = (v8 - (_BYTE *)__p) >> 4;
      v12 = v11 + 1;
      if ((unint64_t)(v11 + 1) >> 60)
        std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
      v13 = v20 - (_BYTE *)__p;
      if ((v20 - (_BYTE *)__p) >> 3 > v12)
        v12 = v13 >> 3;
      if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF0)
        v14 = 0xFFFFFFFFFFFFFFFLL;
      else
        v14 = v12;
      if (v14)
      {
        v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<gm::Matrix<double,2,1>>>((uint64_t)&v20, v14);
        v10 = (char *)__p;
        v8 = v19;
      }
      else
      {
        v15 = 0;
      }
      v16 = &v15[16 * v11];
      *(_OWORD *)v16 = *(_OWORD *)(v3 + 16 * v7);
      v9 = v16 + 16;
      if (v8 != v10)
      {
        do
        {
          *((_OWORD *)v16 - 1) = *((_OWORD *)v8 - 1);
          v16 -= 16;
          v8 -= 16;
        }
        while (v8 != v10);
        v10 = (char *)__p;
      }
      __p = v16;
      v19 = v9;
      v20 = &v15[16 * v14];
      if (v10)
        operator delete(v10);
    }
    else
    {
      *(_OWORD *)v8 = *(_OWORD *)(v3 + 16 * v7);
      v9 = v8 + 16;
    }
    v19 = v9;
    ++v7;
    v8 = v9;
  }
  while (v7 != v6);
  isSelf = geo::Intersect::isSelfIntersecting<double>(&__p, 0);
  if (__p)
  {
    v19 = (char *)__p;
    operator delete(__p);
  }
  return isSelf;
}

- (CGFloat)locationAtPointIndex:(NSUInteger)index
{
  double var1;
  double var0;
  NSUInteger pointCount;
  NSUInteger v6;
  $F24F406B2B787EFB06265DBA3D28CBD5 *points;
  double *p_var1;
  double v9;
  double v10;
  double v11;
  double v12;
  id v14;

  pointCount = self->_pointCount;
  if (pointCount <= index)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], CFSTR("Invalid index"), 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v14);
  }
  v6 = pointCount - 1;
  if (v6 >= index)
    v6 = index;
  if (v6)
  {
    points = self->_points;
    var0 = points->var0;
    var1 = points->var1;
    p_var1 = &points[1].var1;
    v9 = 0.0;
    do
    {
      v10 = *(p_var1 - 1);
      v11 = *p_var1;
      v9 = v9 + sqrt((*p_var1 - var1) * (*p_var1 - var1) + (v10 - var0) * (v10 - var0));
      p_var1 += 2;
      var1 = v11;
      var0 = v10;
      --v6;
    }
    while (v6);
  }
  else
  {
    v9 = 0.0;
  }
  -[MKMultiPoint _mapPointsLength](self, "_mapPointsLength", var1, var0);
  return v9 / v12;
}

- (NSArray)locationsAtPointIndexes:(NSIndexSet *)indexes
{
  NSIndexSet *v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  double v9;
  unint64_t i;
  unint64_t v11;
  unint64_t v12;
  $F24F406B2B787EFB06265DBA3D28CBD5 *v13;
  void *v14;
  id v16;

  v4 = indexes;
  if (-[NSIndexSet count](v4, "count") && -[NSIndexSet lastIndex](v4, "lastIndex") >= self->_pointCount)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], CFSTR("Invalid index"), 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v16);
  }
  -[MKMultiPoint _mapPointsLength](self, "_mapPointsLength");
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSIndexSet count](v4, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSIndexSet containsIndex:](v4, "containsIndex:", 0))
    objc_msgSend(v7, "addObject:", &unk_1E2159100);
  v8 = 0;
  v9 = 0.0;
  for (i = 1; ; ++i)
  {
    v11 = -[NSIndexSet lastIndex](v4, "lastIndex");
    v12 = self->_pointCount - 1;
    if (v11 < v12)
      v12 = -[NSIndexSet lastIndex](v4, "lastIndex");
    if (i > v12)
      break;
    v13 = &self->_points[v8];
    v9 = v9
       + sqrt((v13[1].var1 - v13->var1) * (v13[1].var1 - v13->var1) + (v13[1].var0 - v13->var0)
                                                                    * (v13[1].var0 - v13->var0));
    if (-[NSIndexSet containsIndex:](v4, "containsIndex:", i))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9 / v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v14);

    }
    ++v8;
  }

  return (NSArray *)v7;
}

- (NSUInteger)pointCount
{
  return self->_pointCount;
}

@end
