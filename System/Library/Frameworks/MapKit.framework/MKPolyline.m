@implementation MKPolyline

- (id)_initWithGeoJSONObject:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  MKPolyline *v10;
  __CFString *v11;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      v11 = CFSTR("LineString object must be a dictionary");
LABEL_8:
      _errorWithReason(v11);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = _geoJSONGeometryType((uint64_t)v7);

  if (v8 != 3)
  {
    if (a4)
    {
      v11 = CFSTR("Input is not a LineString GeoJSON object");
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("coordinates"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  self = (MKPolyline *)-[MKPolyline _initWithGeoJSONPoints:error:](self, "_initWithGeoJSONPoints:error:", v9, a4);

  v10 = self;
LABEL_10:

  return v10;
}

- (id)_initWithGeoJSONPoints:(id)a3 error:(id *)a4
{
  id v6;
  MKPolyline *v7;
  char *VerticesFromGeoJSON;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MKPolyline;
  v7 = -[MKPolyline init](&v10, sel_init);
  if (v7)
  {
    VerticesFromGeoJSON = _createVerticesFromGeoJSON(v6, a4);
    if (VerticesFromGeoJSON)
    {
      -[MKMultiPoint _assignPoints:count:](v7, "_assignPoints:count:", VerticesFromGeoJSON, objc_msgSend(v6, "count"));
      VerticesFromGeoJSON = v7;
    }
  }
  else
  {
    VerticesFromGeoJSON = 0;
  }

  return VerticesFromGeoJSON;
}

+ (MKPolyline)polylineWithPoints:(const MKMapPoint *)points count:(NSUInteger)count
{
  id v6;

  v6 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v6, "_setPoints:count:", points, count);
  return (MKPolyline *)v6;
}

+ (MKPolyline)polylineWithCoordinates:(const CLLocationCoordinate2D *)coords count:(NSUInteger)count
{
  return (MKPolyline *)objc_msgSend((id)objc_opt_class(), "polylineWithCoordinates:elevations:count:elevationCorrection:", coords, 0, count, 0);
}

+ (MKPolyline)polylineWithCoordinates:(const CLLocationCoordinate2D *)a3 elevations:(const double *)a4 count:(unint64_t)a5 elevationCorrection:(BOOL)a6
{
  _BOOL8 v6;
  id v10;

  v6 = a6;
  v10 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v10, "_setCoordinates:elevations:count:", a3, a4, a5);
  objc_msgSend(v10, "setNeedsElevationCorrection:", v6);
  return (MKPolyline *)v10;
}

- (void)_calculateBounds
{
  void *v3;
  MKPolyline *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v3 = (void *)MEMORY[0x18D778BE4](self, a2);
  v4 = objc_retainAutorelease(self);
  v5 = -[MKMultiPoint points](v4, "points");
  v6 = -[MKMultiPoint pointCount](v4, "pointCount");
  if (v6)
  {
    v7 = MKMapRectBoundingMapPoints(v5, v6);
  }
  else
  {
    v9 = 0.0;
    v8 = INFINITY;
    v7 = INFINITY;
    v10 = 0.0;
  }
  -[MKMultiPoint _setBounds:](v4, "_setBounds:", v7, v8, v9, v10);
  objc_autoreleasePoolPop(v3);
}

- (CLLocationCoordinate2D)coordinate
{
  double v2;
  double v3;
  objc_super v4;
  CLLocationCoordinate2D result;

  v4.receiver = self;
  v4.super_class = (Class)MKPolyline;
  -[MKMultiPoint coordinate](&v4, sel_coordinate);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (BOOL)intersectsMapRect:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MKPolyline;
  return -[MKMultiPoint intersectsMapRect:](&v4, sel_intersectsMapRect_, a3.var0.var0, a3.var0.var1, a3.var1.var0, a3.var1.var1);
}

- ($FD2884BA735A6398BD92EEF91FE53E55)boundingMapRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  $FD2884BA735A6398BD92EEF91FE53E55 result;

  v6.receiver = self;
  v6.super_class = (Class)MKPolyline;
  -[MKMultiPoint boundingMapRect](&v6, sel_boundingMapRect);
  result.var1.var1 = v5;
  result.var1.var0 = v4;
  result.var0.var1 = v3;
  result.var0.var0 = v2;
  return result;
}

- (BOOL)_requiresModernMap
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MKPolyline)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MKPolyline;
  return -[MKMultiPoint initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKPolyline;
  -[MKMultiPoint encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (BOOL)needsElevationCorrection
{
  return *(&self->super._selfIntersecting + 1);
}

- (void)setNeedsElevationCorrection:(BOOL)a3
{
  *(&self->super._selfIntersecting + 1) = a3;
}

@end
