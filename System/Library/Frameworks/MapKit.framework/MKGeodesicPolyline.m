@implementation MKGeodesicPolyline

+ (MKGeodesicPolyline)polylineWithPoints:(const MKMapPoint *)points count:(NSUInteger)count
{
  NSUInteger v4;
  MKGeodesicPolyline *v6;
  MKGeodesicPolyline *v8;
  MKMapPoint *i;

  if (!count)
    return (MKGeodesicPolyline *)0;
  v4 = count;
  if (count == 1)
  {
    v6 = objc_alloc_init(MKGeodesicPolyline);
    -[MKMultiPoint _setPoints:count:](v6, "_setPoints:count:", points, 1);
    return v6;
  }
  else
  {
    v8 = objc_alloc_init(MKGeodesicPolyline);
    for (i = (MKMapPoint *)&points[1]; --v4; ++i)
    {
      MKCoordinateForMapPoint(i[-1]);
      MKCoordinateForMapPoint(*i);
      GEOGeodesicEvaluate();
    }
    -[MKMultiPoint _setCoordinates:count:](v8, "_setCoordinates:count:");
    return v8;
  }
}

+ (MKGeodesicPolyline)polylineWithCoordinates:(const CLLocationCoordinate2D *)coords count:(NSUInteger)count
{
  NSUInteger v4;
  MKGeodesicPolyline *v6;
  MKGeodesicPolyline *v8;
  const CLLocationCoordinate2D *i;
  const CLLocationCoordinate2D *v10;

  if (!count)
    return (MKGeodesicPolyline *)0;
  v4 = count;
  if (count == 1)
  {
    v6 = objc_alloc_init(MKGeodesicPolyline);
    -[MKMultiPoint _setCoordinates:count:](v6, "_setCoordinates:count:", coords, 1);
    return v6;
  }
  else
  {
    v8 = objc_alloc_init(MKGeodesicPolyline);
    for (i = coords + 1; --v4; i = v10)
    {
      v10 = i + 1;
      GEOGeodesicEvaluate();
    }
    -[MKMultiPoint _setCoordinates:count:](v8, "_setCoordinates:count:");
    return v8;
  }
}

@end
